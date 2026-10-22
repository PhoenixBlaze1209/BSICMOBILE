import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:relay/design_system/tokens.dart';
import 'package:relay/features/tasks/domain/task.dart';
import 'package:relay/features/tasks/domain/task_types.dart';

final class PriorityBadge extends StatelessWidget {
  const PriorityBadge({required this.priority, super.key});

  final Priority priority;

  @override
  Widget build(BuildContext context) {
    final (color, icon, label) = switch (priority) {
      Priority.critical => (
        RelayColors.critical,
        Icons.crisis_alert,
        'Critical',
      ),
      Priority.high => (RelayColors.high, Icons.priority_high, 'High'),
      Priority.medium => (RelayColors.medium, Icons.drag_handle, 'Medium'),
      Priority.low => (RelayColors.low, Icons.arrow_downward, 'Low'),
    };
    return Semantics(
      label: '$label priority',
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: RelayRadii.control,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(color: color, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

final class StatusChip extends StatelessWidget {
  const StatusChip({required this.status, super.key});

  final TaskStatus status;

  @override
  Widget build(BuildContext context) => Chip(
    avatar: Icon(_icon, size: 18),
    label: Text(_label),
    visualDensity: VisualDensity.compact,
  );

  String get _label => switch (status) {
    TaskStatus.inProgress => 'In progress',
    TaskStatus.inReview => 'In review',
    _ => status.name[0].toUpperCase() + status.name.substring(1),
  };

  IconData get _icon => switch (status) {
    TaskStatus.blocked => Icons.block,
    TaskStatus.done => Icons.check_circle,
    TaskStatus.cancelled => Icons.cancel,
    TaskStatus.assigned => Icons.assignment_ind,
    TaskStatus.inProgress => Icons.play_circle,
    TaskStatus.inReview => Icons.rate_review,
    _ => Icons.circle_outlined,
  };
}

final class SlaCountdown extends StatelessWidget {
  const SlaCountdown({
    required this.deadline,
    required this.now,
    this.color,
    super.key,
  });

  final DateTime? deadline;
  final DateTime now;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (deadline == null) return const Text('No SLA');
    final remaining = deadline!.difference(now);
    final overdue = remaining.isNegative;
    final minutes = remaining.inMinutes.abs();
    final label = minutes < 60
        ? '${minutes}m'
        : '${minutes ~/ 60}h ${minutes % 60}m';
    final foreground =
        color ?? (overdue ? Theme.of(context).colorScheme.error : null);
    return Semantics(
      label: overdue ? 'SLA overdue by $label' : '$label remaining on SLA',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            overdue ? Icons.error_outline : Icons.schedule,
            size: 18,
            color: foreground,
          ),
          const SizedBox(width: 4),
          Text(
            overdue ? '$label overdue' : '$label left',
            style: TextStyle(color: foreground, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

final class AssigneeAvatar extends StatelessWidget {
  const AssigneeAvatar({required this.name, this.radius = 18, super.key});

  final String name;
  final double radius;

  @override
  Widget build(BuildContext context) => Semantics(
    label: 'Assigned to $name',
    child: CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      child: Text(
        name
            .split(' ')
            .where((part) => part.isNotEmpty)
            .take(2)
            .map((part) => part[0])
            .join(),
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
      ),
    ),
  );
}

final class EscalationLadder extends StatelessWidget {
  const EscalationLadder({
    required this.steps,
    required this.currentLevel,
    super.key,
  });

  final List<String> steps;
  final int currentLevel;

  @override
  Widget build(BuildContext context) => Semantics(
    label: 'Escalation level $currentLevel of ${steps.length}',
    child: Column(
      children: [
        for (var index = 0; index < steps.length; index++)
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: index < currentLevel
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.surfaceContainerHighest,
                child: Text('${index + 1}'),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(steps[index])),
              Icon(
                index < currentLevel
                    ? Icons.notifications_active
                    : Icons.schedule,
              ),
            ],
          ),
      ].separatedBy(const SizedBox(height: 12)),
    ),
  );
}

final class SyncIndicator extends StatelessWidget {
  const SyncIndicator({required this.state, super.key});
  final SyncState state;

  @override
  Widget build(BuildContext context) {
    final (icon, label) = switch (state) {
      SyncState.synced => (Icons.cloud_done_outlined, 'Synced'),
      SyncState.pending => (Icons.sync, 'Pending sync'),
      SyncState.failed => (Icons.cloud_off, 'Sync failed'),
    };
    return Tooltip(
      message: label,
      child: Icon(icon, semanticLabel: label, size: 20),
    );
  }
}

final class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.task,
    required this.now,
    this.expanded = false,
    this.onTap,
    super.key,
  });

  final Task task;
  final DateTime now;
  final bool expanded;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final compact = constraints.maxWidth < 520;
      return InkWell(
        onTap: onTap,
        borderRadius: RelayRadii.panel,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PriorityBadge(priority: task.priority),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.title,
                          maxLines: compact ? 2 : 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          task.teamId ?? 'No team',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  if (!compact) ...[
                    SlaCountdown(
                      deadline: task.slaDeadlineAt ?? task.dueAt,
                      now: now,
                    ),
                    const SizedBox(width: 8),
                    SyncIndicator(state: task.syncState),
                  ],
                ],
              ),
              if (compact) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: SlaCountdown(
                        deadline: task.slaDeadlineAt ?? task.dueAt,
                        now: now,
                      ),
                    ),
                    SyncIndicator(state: task.syncState),
                  ],
                ),
              ],
              if (expanded) ...[
                const SizedBox(height: 16),
                EscalationLadder(
                  steps: const [
                    'Assignee response',
                    'Team lead',
                    'Organization owner',
                  ],
                  currentLevel: task.escalationLevel,
                ),
              ],
            ],
          ),
        ),
      );
    },
  );
}

final class EmptyState extends StatelessWidget {
  const EmptyState({
    required this.title,
    required this.message,
    this.action,
    super.key,
  });
  final String title;
  final String message;
  final Widget? action;

  @override
  Widget build(BuildContext context) => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 420),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.route,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(message, textAlign: TextAlign.center),
            if (action != null) ...[const SizedBox(height: 24), action!],
          ],
        ),
      ),
    ),
  );
}

final class ErrorState extends StatelessWidget {
  const ErrorState({required this.message, required this.onRetry, super.key});
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => EmptyState(
    title: 'Could not load this view',
    message: '$message Your saved work is still on this device.',
    action: FilledButton.icon(
      onPressed: onRetry,
      icon: const Icon(Icons.refresh),
      label: const Text('Try again'),
    ),
  );
}

final class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({required this.title, required this.message, super.key});
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context, false),
        child: const Text('Cancel'),
      ),
      FilledButton(
        onPressed: () => Navigator.pop(context, true),
        child: const Text('Confirm'),
      ),
    ],
  );
}

extension _SeparatedWidgets on List<Widget> {
  List<Widget> separatedBy(Widget separator) {
    if (length < 2) return this;
    return [
      for (var index = 0; index < length; index++) ...[
        if (index > 0) separator,
        this[index],
      ],
    ];
  }
}

String formatTaskDate(DateTime value) =>
    DateFormat.MMMd().add_jm().format(value.toLocal());
