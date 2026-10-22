import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relay/features/tasks/domain/task_types.dart';

part 'escalation_models.freezed.dart';
part 'escalation_models.g.dart';

enum EscalationTrigger {
  unacknowledged,
  overdue,
  slaBreach,
  stalled,
  blockedTooLong,
  manual,
}

enum EscalationTargetType { assigneeManager, teamLead, specificUser, role }

enum EscalationAction { notify, reassign, raisePriority, notifyAndReassign }

@freezed
abstract class EscalationStep with _$EscalationStep {
  const factory EscalationStep({
    required int level,
    required EscalationTrigger triggerCondition,
    required Duration afterDuration,
    required List<EscalationTargetType> notifyTargets,
    required EscalationAction action,
    required int maxRepeats,
    Duration? repeatEvery,
    String? specificUserId,
    MemberRole? targetRole,
  }) = _EscalationStep;

  factory EscalationStep.fromJson(Map<String, Object?> json) =>
      _$EscalationStepFromJson(json);
}

@freezed
abstract class EscalationPolicy with _$EscalationPolicy {
  const factory EscalationPolicy({
    required String id,
    required String orgId,
    required String name,
    required List<EscalationStep> steps,
    required Set<Priority> priorities,
    required Set<String> teamIds,
    required bool isDefault,
    required bool active,
  }) = _EscalationPolicy;

  factory EscalationPolicy.fromJson(Map<String, Object?> json) =>
      _$EscalationPolicyFromJson(json);
}

@freezed
abstract class EscalationEvent with _$EscalationEvent {
  const factory EscalationEvent({
    required String id,
    required String taskId,
    required int fromLevel,
    required int toLevel,
    required EscalationTrigger reason,
    required String triggeredBy,
    required List<String> notifiedUserIds,
    required DateTime createdAt,
    @Default(0) int repeat,
  }) = _EscalationEvent;

  factory EscalationEvent.fromJson(Map<String, Object?> json) =>
      _$EscalationEventFromJson(json);
}
