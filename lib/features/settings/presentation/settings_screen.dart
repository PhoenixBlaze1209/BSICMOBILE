import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Settings')),
    body: ListView(
      padding: const EdgeInsets.only(bottom: 96),
      children: [
        const _Heading('Account'),
        const ListTile(
          leading: CircleAvatar(child: Text('AC')),
          title: Text('Alex Chen'),
          subtitle: Text('alex@example.com'),
          trailing: Icon(Icons.chevron_right),
        ),
        const ListTile(
          leading: Icon(Icons.public),
          title: Text('Timezone'),
          subtitle: Text('Asia/Manila'),
          trailing: Icon(Icons.chevron_right),
        ),
        const ListTile(
          leading: Icon(Icons.schedule),
          title: Text('Working hours'),
          subtitle: Text('Mon–Fri · 09:00–17:00'),
          trailing: Icon(Icons.chevron_right),
        ),
        const _Heading('Availability'),
        SwitchListTile(
          secondary: const Icon(Icons.beach_access_outlined),
          title: const Text('Away'),
          subtitle: const Text('Route new assignments to your delegate'),
          value: false,
          onChanged: (_) {},
        ),
        const ListTile(
          leading: Icon(Icons.person_pin_outlined),
          title: Text('Delegate'),
          subtitle: Text('Not set'),
          trailing: Icon(Icons.chevron_right),
        ),
        const ListTile(
          leading: Icon(Icons.bedtime_outlined),
          title: Text('Quiet hours'),
          subtitle: Text('22:00–07:00 · critical bypasses'),
          trailing: Icon(Icons.chevron_right),
        ),
        const _Heading('Notifications and appearance'),
        const ListTile(
          leading: Icon(Icons.notifications_outlined),
          title: Text('Notification preferences'),
          subtitle: Text('Push and in-app enabled'),
          trailing: Icon(Icons.chevron_right),
        ),
        const ListTile(
          leading: Icon(Icons.contrast),
          title: Text('Theme'),
          subtitle: Text('Follow system'),
          trailing: Icon(Icons.chevron_right),
        ),
        const _Heading('Organization'),
        ListTile(
          leading: const Icon(Icons.groups_outlined),
          title: const Text('Teams and members'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => context.push('/organization/members'),
        ),
        ListTile(
          leading: const Icon(Icons.account_tree_outlined),
          title: const Text('Escalation policies'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => context.push('/organization/policies'),
        ),
        ListTile(
          leading: const Icon(Icons.analytics_outlined),
          title: const Text('Analytics'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => context.push('/analytics'),
        ),
        const _Heading('Privacy'),
        const ListTile(
          leading: Icon(Icons.download_outlined),
          title: Text('Export my data'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(
            Icons.delete_forever_outlined,
            color: Theme.of(context).colorScheme.error,
          ),
          title: Text(
            'Delete account',
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
          onTap: () {},
        ),
      ],
    ),
  );
}

final class _Heading extends StatelessWidget {
  const _Heading(this.text);
  final String text;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 28, 16, 8),
    child: Text(
      text,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}
