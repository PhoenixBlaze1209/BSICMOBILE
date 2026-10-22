import 'package:flutter/material.dart';

final class MembersScreen extends StatelessWidget {
  const MembersScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Teams and members'),
      actions: [
        IconButton(
          onPressed: () {},
          tooltip: 'Invite member',
          icon: const Icon(Icons.person_add_alt),
        ),
      ],
    ),
    body: ListView(
      children: const [
        ListTile(
          leading: CircleAvatar(child: Text('JL')),
          title: Text('Jordan Lee'),
          subtitle: Text('Owner · Product'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: CircleAvatar(child: Text('PS')),
          title: Text('Priya Shah'),
          subtitle: Text('Manager · Payments'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: CircleAvatar(child: Text('AC')),
          title: Text('Alex Chen'),
          subtitle: Text('Member · Payments'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: CircleAvatar(child: Text('MB')),
          title: Text('Morgan Bell'),
          subtitle: Text('Away · delegated to Casey Nguyen'),
          trailing: Icon(Icons.chevron_right),
        ),
      ],
    ),
  );
}

final class PolicyEditorScreen extends StatefulWidget {
  const PolicyEditorScreen({super.key});
  @override
  State<PolicyEditorScreen> createState() => _PolicyEditorScreenState();
}

final class _PolicyEditorScreenState extends State<PolicyEditorScreen> {
  final steps = <String>[
    'Notify assignee manager after 30m',
    'Notify team lead after 1h',
    'Notify owner after 4h',
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Default escalation policy'),
      actions: [
        TextButton(
          onPressed: () =>
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Policy saved.'))),
          child: const Text('Save'),
        ),
      ],
    ),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const TextField(
          decoration: InputDecoration(labelText: 'Policy name'),
          controller: null,
        ),
        const SizedBox(height: 24),
        Text(
          'Steps',
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        ReorderableListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: steps.length,
          onReorderItem: (oldIndex, newIndex) => setState(() {
            final item = steps.removeAt(oldIndex);
            steps.insert(newIndex, item);
          }),
          itemBuilder: (context, index) => ListTile(
            key: ValueKey(steps[index]),
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(steps[index]),
            subtitle: const Text('Business-hours aware'),
            trailing: const Icon(Icons.drag_handle),
          ),
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: () =>
              setState(() => steps.add('Notify owner after 1 business day')),
          icon: const Icon(Icons.add),
          label: const Text('Add step'),
        ),
        const SizedBox(height: 32),
        Text(
          'Preview',
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 8),
        const Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'If a high-priority task assigned Monday at 16:30 remains unaccepted, level 1 fires Tuesday at 10:00. Critical tasks bypass quiet hours.',
            ),
          ),
        ),
      ],
    ),
  );
}
