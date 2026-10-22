import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:relay/app/providers.dart';
import 'package:relay/design_system/components.dart';
import 'package:relay/design_system/tokens.dart';
import 'package:relay/features/tasks/domain/task.dart';
import 'package:relay/features/tasks/domain/task_types.dart';

final class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

final class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  String? expandedTaskId = 'checkout-webhook';

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(taskListControllerProvider);
    return CustomScrollView(
      slivers: [
        SliverAppBar.large(
          title: const Text('Relay'),
          actions: [
            IconButton(
              onPressed: () => context.push('/notifications'),
              tooltip: 'Notifications, 3 unread',
              icon: const Badge(
                label: Text('3'),
                child: Icon(Icons.notifications_outlined),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        async.when(
          loading: () => const SliverFillRemaining(child: _DashboardSkeleton()),
          error: (error, _) => SliverFillRemaining(
            child: ErrorState(
              message: error.runtimeType.toString(),
              onRetry: () => ref.invalidate(taskListControllerProvider),
            ),
          ),
          data: (result) => result.fold(
            onFailure: (failure) => SliverFillRemaining(
              child: ErrorState(
                message: failure.message,
                onRetry: () => ref.invalidate(taskListControllerProvider),
              ),
            ),
            onSuccess: (tasks) => _content(context, tasks),
          ),
        ),
      ],
    );
  }

  Widget _content(BuildContext context, List<Task> tasks) {
    if (tasks.isEmpty) {
      return SliverFillRemaining(
        child: EmptyState(
          title: 'Your route is clear',
          message: 'Assigned work and escalation updates will appear here.',
          action: FilledButton.icon(
            onPressed: () => context.push('/tasks/new'),
            icon: const Icon(Icons.add),
            label: const Text('Create a task'),
          ),
        ),
      );
    }
    final assigned = tasks
        .where((task) => task.status == TaskStatus.assigned)
        .toList();
    final risk = tasks
        .where(
          (task) =>
              task.priority == Priority.critical ||
              task.priority == Priority.high ||
              task.needsAttention,
        )
        .toList();
    final onTrack = tasks.where((task) => !risk.contains(task)).toList();
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
      sliver: SliverList.list(
        children: [
          if (assigned.isNotEmpty) _NextAction(task: assigned.first),
          const SizedBox(height: 32),
          _SectionHeader(
            icon: Icons.warning_amber_rounded,
            title: 'At risk',
            count: risk.length,
            color: Theme.of(context).colorScheme.error,
          ),
          for (final task in risk) ...[
            TaskCard(
              task: task,
              now: ref.read(clockProvider).now(),
              expanded: expandedTaskId == task.id,
              onTap: () => setState(
                () =>
                    expandedTaskId = expandedTaskId == task.id ? null : task.id,
              ),
            ),
            const Divider(),
          ],
          const SizedBox(height: 32),
          _SectionHeader(
            icon: Icons.check_circle_outline,
            title: 'On track',
            count: onTrack.length,
            color: RelayColors.success,
          ),
          for (final task in onTrack) ...[
            TaskCard(
              task: task,
              now: ref.read(clockProvider).now(),
              onTap: () => context.push('/tasks/${task.id}'),
            ),
            const Divider(),
          ],
          const SizedBox(height: 24),
          Text(
            'Illustrative workspace data',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}

final class _NextAction extends ConsumerWidget {
  const _NextAction({required this.task});
  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    return Semantics(
      container: true,
      label: 'Next action: ${task.title}',
      child: ColoredBox(
        color: scheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.bolt, color: scheme.onPrimary),
                  const SizedBox(width: 8),
                  Text(
                    'Next action',
                    style: Theme.of(context).textTheme.labelLarge
                        ?.copyWith(color: scheme.onPrimary),
                  ),
                  const Spacer(),
                  SlaCountdown(
                    deadline: task.assignedAt?.add(
                      task.priority.acceptanceWindow,
                    ),
                    now: ref.read(clockProvider).now(),
                    color: scheme.onPrimary,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                task.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: scheme.onPrimary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${task.teamId} • ${task.priority.name} priority',
                style: TextStyle(
                  color: scheme.onPrimary.withValues(alpha: 0.88),
                ),
              ),
              const SizedBox(height: 20),
              LayoutBuilder(
                builder: (context, constraints) {
                  final accept = FilledButton.tonalIcon(
                    onPressed: () => ref
                        .read(taskListControllerProvider.notifier)
                        .accept(task.id),
                    icon: const Icon(Icons.check),
                    label: const Text('Accept'),
                  );
                  final decline = OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: scheme.onPrimary,
                      side: BorderSide(color: scheme.onPrimary),
                    ),
                    onPressed: () => _decline(context, ref),
                    icon: const Icon(Icons.close),
                    label: const Text('Decline'),
                  );
                  if (constraints.maxWidth < 300) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [accept, const SizedBox(height: 8), decline],
                    );
                  }
                  return Row(
                    children: [
                      Expanded(child: accept),
                      const SizedBox(width: 12),
                      Expanded(child: decline),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _decline(BuildContext context, WidgetRef ref) async {
    final controller = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Decline assignment'),
        content: TextField(
          controller: controller,
          minLines: 2,
          maxLines: 4,
          decoration: const InputDecoration(
            labelText: 'Reason',
            hintText: 'Explain why this should be reassigned',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () =>
                Navigator.pop(context, controller.text.trim().isNotEmpty),
            child: const Text('Decline'),
          ),
        ],
      ),
    );
    final reason = controller.text.trim();
    controller.dispose();
    if ((confirmed ?? false) && context.mounted) {
      await ref
          .read(taskListControllerProvider.notifier)
          .decline(task.id, reason);
    }
  }
}

final class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.icon,
    required this.title,
    required this.count,
    required this.color,
  });
  final IconData icon;
  final String title;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Icon(icon, color: color),
      const SizedBox(width: 8),
      Text(
        '$title ($count)',
        style: Theme.of(context).textTheme.headlineSmall
            ?.copyWith(fontWeight: FontWeight.w800),
      ),
      const Spacer(),
      TextButton(
        onPressed: () => context.go('/tasks'),
        child: const Text('See all'),
      ),
    ],
  );
}

final class _DashboardSkeleton extends StatelessWidget {
  const _DashboardSkeleton();
  @override
  Widget build(BuildContext context) => ListView.separated(
    padding: const EdgeInsets.all(16),
    itemCount: 6,
    separatorBuilder: (_, _) => const SizedBox(height: 12),
    itemBuilder: (_, _) => Container(
      height: 92,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: RelayRadii.panel,
      ),
    ),
  );
}
