import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:relay/design_system/tokens.dart';

final class AppShell extends StatelessWidget {
  const AppShell({required this.child, super.key});

  final Widget child;

  static const destinations = <NavigationDestination>[
    NavigationDestination(
      icon: Icon(Icons.route_outlined),
      selectedIcon: Icon(Icons.route),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.list_alt_outlined),
      selectedIcon: Icon(Icons.list_alt),
      label: 'Tasks',
    ),
    NavigationDestination(
      icon: Icon(Icons.inbox_outlined),
      selectedIcon: Icon(Icons.inbox),
      label: 'Inbox',
    ),
    NavigationDestination(
      icon: Icon(Icons.settings_outlined),
      selectedIcon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  int _index(String location) {
    if (location.startsWith('/tasks')) return 1;
    if (location.startsWith('/inbox')) return 2;
    if (location.startsWith('/settings')) return 3;
    return 0;
  }

  void _go(BuildContext context, int index) {
    context.go(switch (index) {
      0 => '/',
      1 => '/tasks',
      2 => '/inbox',
      _ => '/settings',
    });
  }

  @override
  Widget build(BuildContext context) {
    final index = _index(GoRouterState.of(context).uri.path);
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= RelayBreakpoints.compact;
        if (wide) {
          return Scaffold(
            body: SafeArea(
              child: Row(
                children: [
                  NavigationRail(
                    selectedIndex: index,
                    onDestinationSelected: (value) => _go(context, value),
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 24),
                      child: Text(
                        'R',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    destinations: [
                      for (final destination in destinations)
                        NavigationRailDestination(
                          icon: destination.icon,
                          selectedIcon: destination.selectedIcon,
                          label: Text(destination.label),
                        ),
                    ],
                  ),
                  VerticalDivider(
                    width: 1,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  Expanded(child: child),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () => context.push('/tasks/new'),
              icon: const Icon(Icons.add),
              label: const Text('New task'),
            ),
          );
        }
        return Scaffold(
          body: SafeArea(child: child),
          bottomNavigationBar: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (value) => _go(context, value),
            destinations: destinations,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.push('/tasks/new'),
            tooltip: 'Create task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
