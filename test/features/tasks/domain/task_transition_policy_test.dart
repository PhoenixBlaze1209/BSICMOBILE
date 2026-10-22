import 'package:flutter_test/flutter_test.dart';
import 'package:relay/core/clock.dart';
import 'package:relay/core/result.dart';
import 'package:relay/features/tasks/domain/task.dart';
import 'package:relay/features/tasks/domain/task_transition_policy.dart';
import 'package:relay/features/tasks/domain/task_types.dart';

void main() {
  final now = DateTime.utc(2026, 10, 22, 8);
  Task task(TaskStatus status, {List<String> blockers = const []}) => Task(
    id: 'task',
    orgId: 'org',
    title: 'Valid task',
    description: '',
    creatorId: 'creator',
    assigneeId: 'assignee',
    watcherIds: const [],
    priority: Priority.high,
    status: status,
    tags: const [],
    subtaskIds: const [],
    blockedByTaskIds: blockers,
    attachmentIds: const [],
    escalationLevel: 0,
    createdAt: now,
    updatedAt: now,
    version: 1,
  );

  group('TaskTransitionPolicy', () {
    const policy = TaskTransitionPolicy();

    test('allows every declared edge and rejects undeclared edges', () {
      expect(
        policy.canTransition(
          from: TaskStatus.draft,
          to: TaskStatus.open,
          actorRole: MemberRole.member,
          isAssignee: false,
          isCreator: true,
        ),
        isTrue,
      );
      expect(
        policy.canTransition(
          from: TaskStatus.done,
          to: TaskStatus.inProgress,
          actorRole: MemberRole.owner,
          isAssignee: false,
          isCreator: false,
        ),
        isFalse,
      );
    });

    test('blocked task needs cleared blockers unless a manager forces', () {
      expect(
        policy.canTransition(
          from: TaskStatus.blocked,
          to: TaskStatus.inProgress,
          actorRole: MemberRole.member,
          isAssignee: true,
          isCreator: false,
          hasUnresolvedBlockers: true,
        ),
        isFalse,
      );
      expect(
        policy.canTransition(
          from: TaskStatus.blocked,
          to: TaskStatus.inProgress,
          actorRole: MemberRole.manager,
          isAssignee: false,
          isCreator: false,
          hasUnresolvedBlockers: true,
          force: true,
        ),
        isTrue,
      );
    });

    test('legal transition writes activity and bumps version', () {
      final result = policy.applyTransition(
        task: task(TaskStatus.assigned),
        to: TaskStatus.accepted,
        actorId: 'assignee',
        actorRole: MemberRole.member,
        clock: FakeClock(now),
      );
      expect(result, isA<Success<TaskMutation>>());
      final mutation = (result as Success<TaskMutation>).value;
      expect(mutation.task.version, 2);
      expect(mutation.task.status, TaskStatus.accepted);
      expect(mutation.activity.before['status'], 'assigned');
    });

    test('illegal transition returns typed failure', () {
      final result = policy.applyTransition(
        task: task(TaskStatus.done),
        to: TaskStatus.open,
        actorId: 'creator',
        actorRole: MemberRole.owner,
        clock: FakeClock(now),
      );
      expect(result, isA<Error<TaskMutation>>());
    });
  });
}
