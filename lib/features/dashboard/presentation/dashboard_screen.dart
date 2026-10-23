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
  String? expandedTaskId = 'launch-copy';

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(taskListControllerProvider);
    final largeText = MediaQuery.textScalerOf(context).scale(16) > 24;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 84,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 12),
              child: Transform.translate(
                offset: const Offset(0, 7),
                child: Row(
                  children: [
                    Text(
                      'Relay',
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -1.2,
                          ),
                    ),
                    const Spacer(),
                    if (largeText)
                      IconButton(
                        onPressed: () => context.push('/notifications'),
                        tooltip: 'Inbox, 3 unread',
                        icon: const Badge(
                          label: Text('3'),
                          child: Icon(Icons.inbox_outlined),
                        ),
                      )
                    else
                      TextButton.icon(
                        onPressed: () => context.push('/notifications'),
                        icon: const Badge(
                          label: Text('3'),
                          child: Icon(Icons.inbox_outlined),
                        ),
                        label: const Text('Inbox'),
                      ),
                  ],
                ),
              ),
            ),
          ),
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
    final next = assigned.isEmpty ? null : assigned.first;
    final remaining = tasks.where((task) => task.id != next?.id).toList();
    final risk = remaining
        .where(
          (task) => const {
            'launch-copy',
            'security-review',
            'postmortem',
          }.contains(task.id),
        )
        .toList();
    final onTrack = remaining.where((task) => !risk.contains(task)).toList();
    final now = ref.read(clockProvider).now();

    return SliverList.list(
      children: [
        if (next != null) _NextAction(task: next),
        _SectionHeader(
          icon: Icons.warning_rounded,
          title: 'At risk',
          count: risk.length,
          color: Theme.of(context).colorScheme.error,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border.symmetric(
              horizontal: BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
          ),
          child: Column(
            children: [
              for (var index = 0; index < risk.length; index++) ...[
                _OperationalTaskRow(
                  task: risk[index],
                  now: now,
                  expanded: expandedTaskId == risk[index].id,
                  onTap: () => setState(
                    () => expandedTaskId = expandedTaskId == risk[index].id
                        ? null
                        : risk[index].id,
                  ),
                ),
                if (index != risk.length - 1)
                  const Padding(
                    padding: EdgeInsets.only(left: 26),
                    child: Divider(),
                  ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 24),
        _SectionHeader(
          icon: Icons.check_circle,
          title: 'On track',
          count: onTrack.length,
          color: RelayColors.success,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border.symmetric(
              horizontal: BorderSide(
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
          ),
          child: Column(
            children: [
              for (final task in onTrack)
                _OperationalTaskRow(
                  task: task,
                  now: now,
                  onTap: () => context.push('/tasks/${task.id}'),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 120),
          child: Text(
            'Illustrative workspace data',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ],
    );
  }
}

final class _NextAction extends ConsumerWidget {
  const _NextAction({required this.task});
  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onPrimary = Theme.of(context).colorScheme.onPrimary;
    final largeText = MediaQuery.textScalerOf(context).scale(16) > 24;
    final taskCopy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.bolt, color: onPrimary, size: 22),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                'Next action',
                maxLines: 2,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: onPrimary,
                  fontWeight: FontWeight.w800,
                  letterSpacing: .35,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          task.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: onPrimary,
            fontWeight: FontWeight.w900,
            letterSpacing: -.35,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          '${task.teamId}  •  ${_priorityLabel(task.priority)}  •  Customer impact',
          style: Theme.of(context).textTheme.bodySmall
              ?.copyWith(color: onPrimary.withValues(alpha: .88)),
        ),
      ],
    );
    final countdown = SizedBox(
      width: largeText ? double.infinity : 100,
      child: Container(
        padding: EdgeInsets.only(left: largeText ? 0 : 14),
        decoration: BoxDecoration(
          border: largeText
              ? null
              : Border(
                  left: BorderSide(color: onPrimary.withValues(alpha: .32)),
                ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.timer_outlined, color: onPrimary, size: 18),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    'Accept within',
                    maxLines: 2,
                    style: TextStyle(color: onPrimary, fontSize: 10),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 1),
            Text(
              '${task.assignedAt?.add(task.priority.acceptanceWindow).difference(ref.read(clockProvider).now()).inMinutes.abs() ?? 0}m',
              style: TextStyle(
                color: onPrimary,
                fontSize: 22,
                height: 1,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
    return Semantics(
      container: true,
      label: 'Next action: ${task.title}',
      child: ColoredBox(
        color: RelayColors.cobalt,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (largeText) ...[
                taskCopy,
                const SizedBox(height: 12),
                countdown,
              ] else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: taskCopy),
                    const SizedBox(width: 14),
                    countdown,
                  ],
                ),
              const SizedBox(height: 0),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: onPrimary,
                        foregroundColor: RelayColors.cobalt,
                        minimumSize: const Size.fromHeight(48),
                      ),
                      onPressed: () => ref
                          .read(taskListControllerProvider.notifier)
                          .accept(task.id),
                      icon: const Icon(Icons.check),
                      label: const Text('Accept'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: onPrimary,
                        side: BorderSide(color: onPrimary),
                        minimumSize: const Size.fromHeight(48),
                      ),
                      onPressed: () => _decline(context, ref),
                      icon: const Icon(Icons.close),
                      label: const Text('Decline'),
                    ),
                  ),
                ],
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

final class _OperationalTaskRow extends StatelessWidget {
  const _OperationalTaskRow({
    required this.task,
    required this.now,
    this.expanded = false,
    this.onTap,
  });

  final Task task;
  final DateTime now;
  final bool expanded;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final risk = task.priority != Priority.low;
    final accent = risk
        ? (task.priority == Priority.medium
              ? const Color(0xFFD57A00)
              : Theme.of(context).colorScheme.error)
        : RelayColors.success;
    final person = _personFor(task.id);
    final reduceMotion = MediaQuery.disableAnimationsOf(context);
    final largeText = MediaQuery.textScalerOf(context).scale(16) > 24;
    final detail = expanded ? _EscalationRoute(task: task) : const SizedBox();

    return Semantics(
      button: true,
      expanded: expanded,
      label: '${task.title}, ${task.teamId}, ${task.status.name}',
      child: InkWell(
        onTap: onTap,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(width: 4, color: accent),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                      child: Row(
                        children: [
                          Icon(
                            risk ? Icons.error : Icons.check_circle,
                            color: accent,
                            size: 22,
                          ),
                          const SizedBox(width: 18),
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  task.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    height: 1.1,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${task.teamId}  •  ${_priorityLabel(task.priority)}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 9,
                                    height: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          _ColumnRule(
                            child: _DeadlineCell(
                              task: task,
                              now: now,
                              color: risk
                                  ? accent
                                  : Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                          if (!largeText)
                            _ColumnRule(
                              child: _OwnerCell(
                                initials: person.$1,
                                name: person.$2,
                                status: risk
                                    ? (task.status == TaskStatus.assigned
                                          ? 'Awaiting'
                                          : 'In progress')
                                    : 'On track',
                                color: accent,
                              ),
                            ),
                          Icon(
                            expanded
                                ? Icons.keyboard_arrow_down
                                : Icons.chevron_right,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurfaceVariant,
                          ),
                        ],
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: reduceMotion
                          ? Duration.zero
                          : RelayMotion.standard,
                      switchInCurve: RelayMotion.emphasized,
                      switchOutCurve: Curves.easeIn,
                      transitionBuilder: (child, animation) => FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(.04, 0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        ),
                      ),
                      child: KeyedSubtree(
                        key: ValueKey(expanded),
                        child: detail,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _ColumnRule extends StatelessWidget {
  const _ColumnRule({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
    width: 72,
    margin: const EdgeInsets.only(left: 8),
    padding: const EdgeInsets.only(left: 8),
    decoration: BoxDecoration(
      border: Border(
        left: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
      ),
    ),
    child: child,
  );
}

final class _DeadlineCell extends StatelessWidget {
  const _DeadlineCell({
    required this.task,
    required this.now,
    required this.color,
  });
  final Task task;
  final DateTime now;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final deadline = task.slaDeadlineAt ?? task.dueAt;
    final delta = deadline?.difference(now);
    final label = delta == null
        ? 'No SLA'
        : delta.inMinutes.abs() < 60
        ? '${delta.inMinutes.abs()}m'
        : '${delta.inHours.abs()}h ${delta.inMinutes.abs() % 60}m';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          maxLines: 1,
          style: TextStyle(
            color: color,
            fontSize: 10,
            height: 1.1,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Text('due today', style: TextStyle(fontSize: 9, height: 1.1)),
        Text(
          'SLA ${task.priority == Priority.medium
              ? '6h'
              : task.priority == Priority.low
              ? '5d'
              : '2h'}',
          style: const TextStyle(fontSize: 9, height: 1.1),
        ),
      ],
    );
  }
}

final class _OwnerCell extends StatelessWidget {
  const _OwnerCell({
    required this.initials,
    required this.name,
    required this.status,
    required this.color,
  });
  final String initials;
  final String name;
  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            child: Text(
              initials,
              style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 3),
          Expanded(
            child: Text(
              status,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 9),
            ),
          ),
        ],
      ),
    ],
  );
}

final class _EscalationRoute extends StatelessWidget {
  const _EscalationRoute({required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    final due = task.assignedAt?.add(task.priority.acceptanceWindow);
    final minutes = due?.difference(DateTime.now()).inMinutes ?? 12;
    final steps = <(String, String, String)>[
      ('You', 'Pending acceptance', '${minutes.abs()}m to accept'),
      ('Maya Patel', 'Head of Marketing', 'Escalates in 1h 48m'),
      ('Chris Nguyen', 'VP Product', 'Escalates in 3h 48m'),
    ];
    final largeText = MediaQuery.textScalerOf(context).scale(16) > 24;
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 10, 7),
      padding: const EdgeInsets.fromLTRB(14, 7, 12, 3),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: RelayRadii.panel,
      ),
      child: Column(
        children: [
          for (var index = 0; index < steps.length; index++)
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 34,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundColor: index == 0
                              ? Theme.of(context).colorScheme.error
                              : Theme.of(context).colorScheme.outline,
                          foregroundColor: Colors.white,
                          child: Text('${index + 1}'),
                        ),
                        if (index != steps.length - 1)
                          Expanded(
                            child: Container(
                              width: 1,
                              color: Theme.of(context)
                                  .colorScheme
                                  .outlineVariant,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  steps[index].$1,
                                  style: Theme.of(context).textTheme.labelMedium
                                      ?.copyWith(fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  steps[index].$2,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (!largeText)
                            Text(
                              steps[index].$3,
                              textAlign: TextAlign.right,
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(
                                    color: index == 0
                                        ? Theme.of(context).colorScheme.error
                                        : null,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

(String, String) _personFor(String taskId) => switch (taskId) {
  'launch-copy' => ('JL', 'Jordan Lee'),
  'security-review' => ('MP', 'Maya Patel'),
  'postmortem' => ('AK', 'Alex Kim'),
  'access-review' => ('DL', 'Devon Lane'),
  'design-audit' => ('PR', 'Priya Rao'),
  'retention-policy' => ('SC', 'Sam Chen'),
  _ => ('AC', 'Alex Chen'),
};

String _priorityLabel(Priority priority) => switch (priority) {
  Priority.critical || Priority.high => 'P1',
  Priority.medium => 'P2',
  Priority.low => 'P3',
};

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
  Widget build(BuildContext context) {
    final largeText = MediaQuery.textScalerOf(context).scale(16) > 24;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 12, 0),
      child: Row(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '$title ($count)',
              maxLines: 2,
              style: Theme.of(context).textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w900, letterSpacing: -.4),
            ),
          ),
          if (largeText)
            IconButton(
              onPressed: () => context.go('/tasks'),
              tooltip: 'See all $title tasks',
              icon: const Icon(Icons.chevron_right),
            )
          else
            TextButton.icon(
              style: TextButton.styleFrom(
                minimumSize: const Size(64, 36),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () => context.go('/tasks'),
              iconAlignment: IconAlignment.end,
              icon: const Icon(Icons.chevron_right),
              label: const Text('See all'),
            ),
        ],
      ),
    );
  }
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
