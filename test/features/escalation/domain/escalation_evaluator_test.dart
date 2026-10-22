import 'package:flutter_test/flutter_test.dart';
import 'package:relay/features/escalation/domain/escalation_evaluator.dart';
import 'package:relay/features/escalation/domain/escalation_models.dart';
import 'package:relay/features/organization/domain/organization_models.dart';
import 'package:relay/features/priority/domain/business_calendar.dart';
import 'package:relay/features/tasks/domain/task.dart';
import 'package:relay/features/tasks/domain/task_types.dart';
import 'package:timezone/data/latest.dart' as tzdata;

void main() {
  setUpAll(tzdata.initializeTimeZones);
  final hours = WorkingHours(
    intervalsByWeekday: {
      for (var day = 1; day <= 5; day++)
        day: const [WorkingInterval(startMinute: 540, endMinute: 1020)],
    },
  );
  late BusinessCalendar calendar;
  late EscalationPolicy policy;
  late EscalationEvaluator evaluator;

  setUp(() {
    calendar = BusinessCalendar(
      timezone: 'Asia/Manila',
      workingHours: hours,
      holidayDates: {},
    );
    policy = const EscalationPolicy(
      id: 'policy',
      orgId: 'org',
      name: 'Default',
      steps: [
        EscalationStep(
          level: 1,
          triggerCondition: EscalationTrigger.unacknowledged,
          afterDuration: Duration(minutes: 30),
          notifyTargets: [EscalationTargetType.assigneeManager],
          action: EscalationAction.notify,
          maxRepeats: 0,
        ),
      ],
      priorities: {Priority.high},
      teamIds: {},
      isDefault: true,
      active: true,
    );
    evaluator = const EscalationEvaluator(
      stalledThresholds: {},
      blockedThresholds: {},
    );
  });

  test('fires after acceptance and step delay with deterministic key', () {
    final assigned = DateTime.utc(2026, 10, 22);
    final task = Task(
      id: 'task',
      orgId: 'org',
      title: 'Task',
      description: '',
      creatorId: 'creator',
      assigneeId: 'user',
      watcherIds: const [],
      priority: Priority.high,
      status: TaskStatus.assigned,
      tags: const [],
      subtaskIds: const [],
      blockedByTaskIds: const [],
      attachmentIds: const [],
      escalationLevel: 0,
      createdAt: assigned,
      updatedAt: assigned,
      assignedAt: assigned,
      version: 1,
    );
    final result = evaluator.evaluate(
      task: task,
      policy: policy,
      now: DateTime.utc(2026, 10, 22, 2, 31),
      calendar: calendar,
      events: const [],
    );
    expect(result, isA<Escalate>());
    expect((result as Escalate).idempotencyKey, 'task:1:unacknowledged');
  });
}
