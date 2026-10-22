import 'package:flutter/material.dart';

final class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Analytics')),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Last 30 days · illustrative',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 24),
        const _Metric(
          label: 'Completion rate',
          value: '87%',
          detail: '146 of 168 tasks completed',
        ),
        const Divider(),
        const _Metric(
          label: 'Mean time to accept',
          value: '38m',
          detail: '12m faster than the previous period',
        ),
        const Divider(),
        const _Metric(
          label: 'SLA compliance',
          value: '92%',
          detail: '13 tasks breached their SLA',
        ),
        const SizedBox(height: 32),
        Text(
          'Escalations by team',
          style: Theme.of(context).textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 16),
        const _TeamBar(label: 'Payments', value: 0.72, count: 18),
        const _TeamBar(label: 'Marketing', value: 0.44, count: 11),
        const _TeamBar(label: 'Security', value: 0.28, count: 7),
      ],
    ),
  );
}

final class _Metric extends StatelessWidget {
  const _Metric({
    required this.label,
    required this.value,
    required this.detail,
  });
  final String label;
  final String value;
  final String detail;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(detail),
            ],
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.displaySmall
              ?.copyWith(fontWeight: FontWeight.w800),
        ),
      ],
    ),
  );
}

final class _TeamBar extends StatelessWidget {
  const _TeamBar({
    required this.label,
    required this.value,
    required this.count,
  });
  final String label;
  final double value;
  final int count;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Row(
      children: [
        SizedBox(width: 96, child: Text(label)),
        Expanded(
          child: LinearProgressIndicator(
            value: value,
            minHeight: 12,
            semanticsLabel: '$label, $count escalations',
          ),
        ),
        const SizedBox(width: 12),
        Text('$count'),
      ],
    ),
  );
}
