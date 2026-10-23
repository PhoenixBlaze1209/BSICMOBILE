import 'dart:async';

import 'package:relay/core/clock.dart';
import 'package:relay/core/result.dart';
import 'package:relay/features/organization/domain/permission_policy.dart';
import 'package:relay/features/tasks/application/task_use_cases.dart';
import 'package:relay/features/tasks/data/in_memory_task_repository.dart';
import 'package:relay/features/tasks/domain/repositories.dart';
import 'package:relay/features/tasks/domain/task.dart';
import 'package:relay/features/tasks/domain/task_transition_policy.dart';
import 'package:relay/features/tasks/domain/task_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

const demoOrgId = 'relay-demo-org';
const demoUserId = 'alex-chen';

@Riverpod(keepAlive: true)
Clock clock(Ref ref) => const SystemClock();

@Riverpod(keepAlive: true)
TaskRepository taskRepository(Ref ref) {
  final now = ref.read(clockProvider).now();
  return InMemoryTaskRepository([
    _task(
      id: 'checkout-webhook',
      title: 'Restore checkout webhook',
      team: 'Payments',
      priority: Priority.critical,
      status: TaskStatus.assigned,
      now: now,
      dueIn: const Duration(minutes: -18),
      slaIn: const Duration(minutes: -8),
      escalationLevel: 1,
      assignedAgo: const Duration(minutes: 3),
    ),
    _task(
      id: 'launch-copy',
      title: 'Approve Q4 launch copy',
      team: 'Marketing',
      priority: Priority.high,
      status: TaskStatus.assigned,
      now: now,
      dueIn: const Duration(hours: 2),
      slaIn: const Duration(minutes: 28),
    ),
    _task(
      id: 'security-review',
      title: 'Vendor security review',
      team: 'Security',
      priority: Priority.high,
      status: TaskStatus.inProgress,
      now: now,
      dueIn: const Duration(hours: 4),
      slaIn: const Duration(hours: 1, minutes: 12),
    ),
    _task(
      id: 'postmortem',
      title: 'Update incident postmortem',
      team: 'Engineering',
      priority: Priority.medium,
      status: TaskStatus.inProgress,
      now: now,
      dueIn: const Duration(hours: 8),
      slaIn: const Duration(hours: 6),
    ),
    _task(
      id: 'access-review',
      title: 'Quarterly access review',
      team: 'IT',
      priority: Priority.low,
      status: TaskStatus.open,
      now: now,
      dueIn: const Duration(days: 4),
      slaIn: const Duration(days: 5),
    ),
    _task(
      id: 'design-audit',
      title: 'Design system audit',
      team: 'Design',
      priority: Priority.low,
      status: TaskStatus.inProgress,
      now: now,
      dueIn: const Duration(days: 3),
      slaIn: const Duration(days: 5),
    ),
    _task(
      id: 'retention-policy',
      title: 'Customer data retention',
      team: 'Legal',
      priority: Priority.low,
      status: TaskStatus.open,
      now: now,
      dueIn: const Duration(days: 6),
      slaIn: const Duration(days: 7),
    ),
  ]);
}

Task _task({
  required String id,
  required String title,
  required String team,
  required Priority priority,
  required TaskStatus status,
  required DateTime now,
  required Duration dueIn,
  required Duration slaIn,
  int escalationLevel = 0,
  Duration assignedAgo = const Duration(minutes: 20),
}) => Task(
  id: id,
  orgId: demoOrgId,
  title: title,
  description: 'Illustrative task used to demonstrate Relay workflows.',
  creatorId: 'jordan-lee',
  assigneeId: demoUserId,
  watcherIds: const ['jordan-lee'],
  teamId: team,
  priority: priority,
  status: status,
  dueAt: now.add(dueIn),
  tags: const <String>[],
  subtaskIds: const <String>[],
  blockedByTaskIds: const <String>[],
  attachmentIds: const <String>[],
  escalationLevel: escalationLevel,
  escalationPolicyId: 'default',
  slaDeadlineAt: now.add(slaIn),
  createdAt: now.subtract(const Duration(days: 2)),
  updatedAt: now.subtract(const Duration(minutes: 20)),
  assignedAt: now.subtract(assignedAgo),
  lastActivityAt: now.subtract(const Duration(minutes: 20)),
  version: 1,
);

@riverpod
class TaskListController extends _$TaskListController {
  @override
  Future<Result<List<Task>>> build() async {
    final repository = ref.read(taskRepositoryProvider);
    final result = await repository.searchTasks(
      orgId: demoOrgId,
      query: '',
      limit: 25,
    );
    return result.fold(
      onSuccess: (page) => Success<List<Task>>(page.items),
      onFailure: (failure) => Error<List<Task>>(failure),
    );
  }

  Future<void> accept(String taskId) =>
      _transition(taskId, TaskStatus.accepted);

  Future<void> decline(String taskId, String reason) async {
    final previous = state.value;
    if (previous is! Success<List<Task>>) return;
    final task = previous.value.where((item) => item.id == taskId).firstOrNull;
    if (task == null) return;
    state = const AsyncLoading<Result<List<Task>>>();
    final changeStatus = ChangeStatus(
      ref.read(taskRepositoryProvider),
      const TaskTransitionPolicy(),
      ref.read(clockProvider),
    );
    final result = await DeclineTask(changeStatus)(
      task: task,
      actorId: demoUserId,
      role: MemberRole.member,
      reason: reason,
    );
    _replace(previous.value, result);
  }

  Future<void> complete(String taskId) => _transition(taskId, TaskStatus.done);

  Future<void> _transition(String taskId, TaskStatus status) async {
    final previous = state.value;
    if (previous is! Success<List<Task>>) return;
    final task = previous.value.where((item) => item.id == taskId).firstOrNull;
    if (task == null) return;
    state = const AsyncLoading<Result<List<Task>>>();
    final useCase = ChangeStatus(
      ref.read(taskRepositoryProvider),
      const TaskTransitionPolicy(),
      ref.read(clockProvider),
    );
    final result = await useCase(
      task: task,
      status: status,
      actorId: demoUserId,
      actorRole: MemberRole.member,
    );
    _replace(previous.value, result);
  }

  Future<String?> saveTask({
    required String title,
    required String description,
    required Priority priority,
    String? taskId,
  }) async {
    final previous = state.value;
    if (previous is! Success<List<Task>>) return 'Tasks are still loading.';
    final repository = ref.read(taskRepositoryProvider);
    final clock = ref.read(clockProvider);
    if (taskId == null) {
      final result = await CreateTask(repository, clock)(
        id: 'task-${clock.now().microsecondsSinceEpoch}',
        orgId: demoOrgId,
        title: title,
        description: description,
        creatorId: demoUserId,
        priority: priority,
      );
      return result.fold(
        onSuccess: (created) {
          state = AsyncData<Result<List<Task>>>(
            Success<List<Task>>([...previous.value, created]),
          );
          return null;
        },
        onFailure: (failure) => failure.message,
      );
    }
    final current = previous.value
        .where((item) => item.id == taskId)
        .firstOrNull;
    if (current == null) return 'The task is no longer available.';
    var result = await UpdateTask(repository, clock)(
      task: current,
      actorId: demoUserId,
      title: title,
      description: description,
    );
    if (result case Success<Task>(:final value)
        when value.priority != priority) {
      result =
          await ChangePriority(repository, const PermissionPolicy(), clock)(
            task: value,
            priority: priority,
            actorId: demoUserId,
            role: MemberRole.member,
          );
    }
    return result.fold(
      onSuccess: (updated) {
        _replace(previous.value, Success<Task>(updated));
        return null;
      },
      onFailure: (failure) => failure.message,
    );
  }

  void _replace(List<Task> previous, Result<Task> result) {
    state = AsyncData<Result<List<Task>>>(
      result.fold(
        onSuccess: (updated) => Success<List<Task>>([
          for (final item in previous)
            if (item.id == updated.id) updated else item,
        ]),
        onFailure: (failure) => Error<List<Task>>(failure),
      ),
    );
  }
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
