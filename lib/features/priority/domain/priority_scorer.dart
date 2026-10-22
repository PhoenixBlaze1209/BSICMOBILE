import 'dart:math' as math;

import 'package:relay/features/tasks/domain/task.dart';
import 'package:relay/features/tasks/domain/task_types.dart';

final class PriorityScorer {
  const PriorityScorer({this.blockingCap = 10});

  final int blockingCap;

  double score(Task task, DateTime now, {int transitivelyBlockedCount = 0}) {
    final priority = (task.priority.weight - 1) / 3;
    final total = task.dueAt?.difference(task.createdAt).inMicroseconds ?? 0;
    final elapsed = now.toUtc().difference(task.createdAt).inMicroseconds;
    final urgency = total <= 0 ? 0.0 : (elapsed / total).clamp(0.0, 1.0);
    final blocking =
        math.min(transitivelyBlockedCount, blockingCap) /
        math.max(blockingCap, 1);
    final ageMinutes = math.max(
      0,
      now.toUtc().difference(task.createdAt).inMinutes,
    );
    final age = math.min(ageMinutes, 43200) / 43200;
    return (100 *
            (0.40 * priority + 0.35 * urgency + 0.15 * blocking + 0.10 * age))
        .clamp(0, 100)
        .toDouble();
  }
}
