import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relay/features/escalation/domain/escalation_models.dart';
import 'package:relay/features/priority/domain/business_calendar.dart';
import 'package:relay/features/tasks/domain/task.dart';
import 'package:relay/features/tasks/domain/task_types.dart';

part 'escalation_evaluator.freezed.dart';

@freezed
sealed class EscalationDecision with _$EscalationDecision {
  const factory EscalationDecision.none({DateTime? nextEvaluationAt}) =
      NoEscalation;
  const factory EscalationDecision.escalate({
    required EscalationTrigger trigger,
    required EscalationStep step,
    required String idempotencyKey,
    required int repeat,
  }) = Escalate;
  const factory EscalationDecision.needsAttention({
    required EscalationTrigger trigger,
  }) = NeedsAttention;
  const factory EscalationDecision.deEscalate({required String reason}) =
      DeEscalate;
}

final class EscalationEvaluator {
  const EscalationEvaluator({
    required this.stalledThresholds,
    required this.blockedThresholds,
  });

  final Map<Priority, Duration> stalledThresholds;
  final Map<Priority, Duration> blockedThresholds;

  EscalationDecision evaluate({
    required Task task,
    required EscalationPolicy policy,
    required DateTime now,
    required BusinessCalendar calendar,
    required List<EscalationEvent> events,
    EscalationTrigger? manualTrigger,
  }) {
    final current = now.toUtc();
    if (task.isDeleted ||
        task.status == TaskStatus.done ||
        task.status == TaskStatus.cancelled) {
      return task.escalationLevel > 0
          ? const EscalationDecision.deEscalate(reason: 'terminal')
          : const EscalationDecision.none();
    }
    if (task.snoozedUntil?.isAfter(current) ?? false) {
      return EscalationDecision.none(nextEvaluationAt: task.snoozedUntil);
    }
    if (!policy.active ||
        (!policy.priorities.contains(task.priority)) ||
        (policy.teamIds.isNotEmpty && !policy.teamIds.contains(task.teamId))) {
      return const EscalationDecision.none();
    }
    final trigger = manualTrigger ?? _triggerFor(task, current, calendar);
    if (trigger == null) return const EscalationDecision.none();
    final ordered = [...policy.steps]
      ..sort((a, b) => a.level.compareTo(b.level));
    final matching = ordered.where((step) => step.triggerCondition == trigger);
    if (matching.isEmpty) return const EscalationDecision.none();
    final nextLevel = task.escalationLevel + 1;
    final eligibleSteps = matching.where((step) => step.level == nextLevel);
    final step = eligibleSteps.isNotEmpty ? eligibleSteps.first : matching.last;
    final repeats = events
        .where(
          (event) => event.toLevel == step.level && event.reason == trigger,
        )
        .length;
    if (task.escalationLevel >= step.level && repeats > step.maxRepeats) {
      return EscalationDecision.needsAttention(trigger: trigger);
    }
    final lastAt = events.isEmpty
        ? _triggerStart(task, trigger, calendar)
        : events
              .map((event) => event.createdAt)
              .reduce((a, b) => a.isAfter(b) ? a : b);
    final wait = repeats == 0 ? step.afterDuration : step.repeatEvery;
    if (wait == null) return const EscalationDecision.none();
    final due = calendar.addWorkingDuration(lastAt, wait);
    if (due.isAfter(current)) {
      return EscalationDecision.none(nextEvaluationAt: due);
    }
    return EscalationDecision.escalate(
      trigger: trigger,
      step: step,
      idempotencyKey: '${task.id}:${step.level}:${trigger.name}',
      repeat: repeats,
    );
  }

  EscalationTrigger? _triggerFor(
    Task task,
    DateTime now,
    BusinessCalendar calendar,
  ) {
    if (task.status == TaskStatus.assigned && task.assignedAt != null) {
      final due = calendar.addWorkingDuration(
        task.assignedAt!,
        task.priority.acceptanceWindow,
      );
      if (!due.isAfter(now)) return EscalationTrigger.unacknowledged;
    }
    if (task.dueAt?.isBefore(now) ?? false) return EscalationTrigger.overdue;
    if (task.slaDeadlineAt?.isBefore(now) ?? false) {
      return EscalationTrigger.slaBreach;
    }
    if (task.status == TaskStatus.blocked && task.blockedAt != null) {
      final due = calendar.addWorkingDuration(
        task.blockedAt!,
        blockedThresholds[task.priority] ?? const Duration(hours: 8),
      );
      if (!due.isAfter(now)) return EscalationTrigger.blockedTooLong;
    }
    if (task.status == TaskStatus.inProgress && task.lastActivityAt != null) {
      final due = calendar.addWorkingDuration(
        task.lastActivityAt!,
        stalledThresholds[task.priority] ?? const Duration(hours: 8),
      );
      if (!due.isAfter(now)) return EscalationTrigger.stalled;
    }
    return null;
  }

  DateTime _triggerStart(
    Task task,
    EscalationTrigger trigger,
    BusinessCalendar calendar,
  ) => switch (trigger) {
    EscalationTrigger.unacknowledged => calendar.addWorkingDuration(
      task.assignedAt ?? task.updatedAt,
      task.priority.acceptanceWindow,
    ),
    EscalationTrigger.overdue => task.dueAt ?? task.updatedAt,
    EscalationTrigger.slaBreach => task.slaDeadlineAt ?? task.updatedAt,
    EscalationTrigger.stalled => task.lastActivityAt ?? task.updatedAt,
    EscalationTrigger.blockedTooLong => task.blockedAt ?? task.updatedAt,
    EscalationTrigger.manual => task.updatedAt,
  };
}
