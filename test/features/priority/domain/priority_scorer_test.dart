import 'package:flutter_test/flutter_test.dart';
import 'package:relay/features/priority/domain/priority_scorer.dart';
import 'package:relay/features/tasks/domain/task.dart';
import 'package:relay/features/tasks/domain/task_types.dart';

void main() {
  Task task({
    required Priority priority,
    required DateTime created,
    DateTime? due,
  }) => Task(
    id: 'task',
    orgId: 'org',
    title: 'Task',
    description: '',
    creatorId: 'user',
    watcherIds: const [],
    priority: priority,
    status: TaskStatus.open,
    dueAt: due,
    tags: const [],
    subtaskIds: const [],
    blockedByTaskIds: const [],
    attachmentIds: const [],
    escalationLevel: 0,
    createdAt: created,
    updatedAt: created,
    version: 1,
  );

  const scorer = PriorityScorer();
  final now = DateTime.utc(2026, 10, 22);

  test('minimum inputs remain in range', () {
    expect(scorer.score(task(priority: Priority.low, created: now), now), 0);
  });

  test('maximum inputs clamp to 100', () {
    final old = now.subtract(const Duration(days: 40));
    final score = scorer.score(
      task(
        priority: Priority.critical,
        created: old,
        due: now.subtract(const Duration(days: 1)),
      ),
      now,
      transitivelyBlockedCount: 100,
    );
    expect(score, 100);
  });

  test(
    'overdue urgency is one and future creation cannot create negative age',
    () {
      final overdue = task(
        priority: Priority.medium,
        created: now.subtract(const Duration(days: 1)),
        due: now.subtract(const Duration(minutes: 1)),
      );
      final future = task(
        priority: Priority.low,
        created: now.add(const Duration(days: 1)),
        due: now.add(const Duration(days: 2)),
      );
      expect(scorer.score(overdue, now), greaterThan(45));
      expect(scorer.score(future, now), inInclusiveRange(0, 100));
    },
  );
}
