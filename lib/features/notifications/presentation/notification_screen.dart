import 'package:flutter/material.dart';

final class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Inbox'),
      actions: [
        TextButton(onPressed: () {}, child: const Text('Mark all read')),
      ],
    ),
    body: ListView(
      padding: const EdgeInsets.only(bottom: 96),
      children: const [
        _NotificationTile(
          icon: Icons.escalator_warning,
          title: 'Restore checkout webhook escalated',
          body: 'Priya Shah and the Payments lead were notified.',
          time: '4 min',
          unread: true,
        ),
        _NotificationTile(
          icon: Icons.assignment_ind,
          title: 'Approve Q4 launch copy assigned to you',
          body: 'Accept or decline within 28 minutes.',
          time: '16 min',
          unread: true,
        ),
        _NotificationTile(
          icon: Icons.alarm,
          title: 'Vendor security review is due soon',
          body: 'The SLA deadline is in 1 hour 12 minutes.',
          time: '1 h',
          unread: true,
        ),
        _NotificationTile(
          icon: Icons.comment_outlined,
          title: 'Jordan mentioned you',
          body: '“Can you confirm the vendor response?”',
          time: 'Yesterday',
          unread: false,
        ),
      ],
    ),
  );
}

final class _NotificationTile extends StatelessWidget {
  const _NotificationTile({
    required this.icon,
    required this.title,
    required this.body,
    required this.time,
    required this.unread,
  });
  final IconData icon;
  final String title;
  final String body;
  final String time;
  final bool unread;

  @override
  Widget build(BuildContext context) => ListTile(
    minVerticalPadding: 16,
    leading: CircleAvatar(child: Icon(icon)),
    title: Text(
      title,
      style: TextStyle(fontWeight: unread ? FontWeight.w800 : FontWeight.w500),
    ),
    subtitle: Text(body),
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(time),
        if (unread)
          const Padding(padding: EdgeInsets.only(top: 6), child: Badge()),
      ],
    ),
    onTap: () {},
  );
}
