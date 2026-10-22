import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:relay/app/providers.dart';
import 'package:relay/core/result.dart';
import 'package:relay/design_system/components.dart';
import 'package:relay/features/tasks/domain/task.dart';
import 'package:relay/features/tasks/domain/task_types.dart';

final class TaskListScreen extends ConsumerStatefulWidget {
  const TaskListScreen({super.key});

  @override
  ConsumerState<TaskListScreen> createState() => _TaskListScreenState();
}

final class _TaskListScreenState extends ConsumerState<TaskListScreen> {
  String query = '';
  Priority? priority;

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(taskListControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SearchBar(
                  hintText: 'Search title or description',
                  leading: const Icon(Icons.search),
                  onChanged: (value) =>
                      setState(() => query = value.toLowerCase()),
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ChoiceChip(
                        label: const Text('All'),
                        selected: priority == null,
                        onSelected: (_) => setState(() => priority = null),
                      ),
                      const SizedBox(width: 8),
                      for (final value in Priority.values) ...[
                        ChoiceChip(
                          label: Text(value.name),
                          selected: priority == value,
                          onSelected: (_) => setState(() => priority = value),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: async.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => ErrorState(
                message: '$error',
                onRetry: () => ref.invalidate(taskListControllerProvider),
              ),
              data: (result) => result.fold(
                onFailure: (failure) => ErrorState(
                  message: failure.message,
                  onRetry: () => ref.invalidate(taskListControllerProvider),
                ),
                onSuccess: (tasks) {
                  final visible = tasks
                      .where(
                        (task) =>
                            (priority == null || task.priority == priority) &&
                            (query.isEmpty ||
                                task.title.toLowerCase().contains(query)),
                      )
                      .toList();
                  if (visible.isEmpty) {
                    return const EmptyState(
                      title: 'No tasks match',
                      message: 'Clear a filter or create a new task.',
                    );
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
                    itemCount: visible.length,
                    separatorBuilder: (_, _) => const Divider(),
                    itemBuilder: (context, index) {
                      final task = visible[index];
                      return Dismissible(
                        key: ValueKey(task.id),
                        direction: DismissDirection.endToStart,
                        confirmDismiss: (_) async {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${task.title} archived'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {},
                              ),
                            ),
                          );
                          return false;
                        },
                        background: ColoredBox(
                          color: Theme.of(context).colorScheme.errorContainer,
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Icon(Icons.archive_outlined),
                            ),
                          ),
                        ),
                        child: TaskCard(
                          task: task,
                          now: ref.read(clockProvider).now(),
                          onTap: () => context.push('/tasks/${task.id}'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final class TaskDetailScreen extends ConsumerWidget {
  const TaskDetailScreen({required this.taskId, super.key});
  final String taskId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(taskListControllerProvider).value;
    final task = result is Success<List<Task>>
        ? result.value.where((item) => item.id == taskId).firstOrNull
        : null;
    if (task == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const EmptyState(
          title: 'Task unavailable',
          message: 'It may have been removed or you no longer have access.',
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
        actions: [
          IconButton(
            onPressed: () => context.push('/tasks/$taskId/edit'),
            tooltip: 'Edit task',
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              PriorityBadge(priority: task.priority),
              StatusChip(status: task.status),
              SyncIndicator(state: task.syncState),
            ],
          ),
          const SizedBox(height: 24),
          Text(task.description, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 32),
          Text(
            'Escalation route',
            style: Theme.of(context).textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),
          EscalationLadder(
            steps: const [
              'Alex Chen · assignee',
              'Priya Shah · team lead',
              'Marcus Lee · organization owner',
            ],
            currentLevel: task.escalationLevel,
          ),
          const SizedBox(height: 32),
          Text(
            'Timeline',
            style: Theme.of(context).textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          const ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.assignment_ind),
            title: Text('Assigned to Alex Chen'),
            subtitle: Text('20 minutes ago · acceptance pending'),
          ),
          const ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.add_task),
            title: Text('Task created by Jordan Lee'),
            subtitle: Text('2 days ago'),
          ),
          const SizedBox(height: 24),
          TextField(
            minLines: 2,
            maxLines: 6,
            decoration: InputDecoration(
              labelText: 'Add a comment',
              suffixIcon: IconButton(
                onPressed: () {},
                tooltip: 'Send comment',
                icon: const Icon(Icons.send),
              ),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => _manualEscalation(context),
            icon: const Icon(Icons.escalator_warning),
            label: const Text('Escalate manually'),
          ),
        ],
      ),
    );
  }

  Future<void> _manualEscalation(BuildContext context) async {
    final controller = TextEditingController();
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Escalate task'),
        content: TextField(
          controller: controller,
          minLines: 2,
          maxLines: 4,
          decoration: const InputDecoration(labelText: 'Required reason'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) Navigator.pop(context);
            },
            child: const Text('Escalate'),
          ),
        ],
      ),
    );
    controller.dispose();
  }
}

final class TaskFormScreen extends ConsumerStatefulWidget {
  const TaskFormScreen({this.taskId, super.key});
  final String? taskId;

  @override
  ConsumerState<TaskFormScreen> createState() => _TaskFormScreenState();
}

final class _TaskFormScreenState extends ConsumerState<TaskFormScreen> {
  final formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final description = TextEditingController();
  Priority priority = Priority.medium;
  bool initialized = false;

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!initialized && widget.taskId != null) {
      final result = ref.watch(taskListControllerProvider).value;
      final task = result is Success<List<Task>>
          ? result.value.where((item) => item.id == widget.taskId).firstOrNull
          : null;
      if (task != null) {
        title.text = task.title;
        description.text = task.description;
        priority = task.priority;
        initialized = true;
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.taskId == null ? 'Create task' : 'Edit task'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: title,
              maxLength: 140,
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (value) =>
                  (value?.trim().isEmpty ?? true) ? 'Enter a title.' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: description,
              minLines: 5,
              maxLines: 10,
              maxLength: 10000,
              decoration: const InputDecoration(
                labelText: 'Description',
                helperText: 'Markdown supported; HTML is removed.',
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<Priority>(
              initialValue: priority,
              decoration: const InputDecoration(labelText: 'Priority'),
              items: [
                for (final value in Priority.values)
                  DropdownMenuItem(value: value, child: Text(value.name)),
              ],
              onChanged: (value) =>
                  setState(() => priority = value ?? priority),
            ),
            const SizedBox(height: 16),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.person_add_alt),
              title: Text('Assignee'),
              subtitle: Text('Unassigned · choose after saving'),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.event),
              title: Text('Due date'),
              subtitle: Text('Not set'),
            ),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.repeat),
              title: Text('Recurrence'),
              subtitle: Text('Does not repeat'),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _save,
              icon: const Icon(Icons.check),
              label: Text(
                widget.taskId == null ? 'Create task' : 'Save changes',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _save() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    final message = await ref
        .read(taskListControllerProvider.notifier)
        .saveTask(
          title: title.text,
          description: description.text,
          priority: priority,
          taskId: widget.taskId,
        );
    if (!mounted) return;
    if (message != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Task saved locally and queued for sync.')),
    );
    context.pop();
  }
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
