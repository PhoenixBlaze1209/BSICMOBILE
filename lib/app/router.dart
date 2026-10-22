import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:relay/app/app_shell.dart';
import 'package:relay/features/auth/presentation/auth_screens.dart';
import 'package:relay/features/dashboard/presentation/analytics_screen.dart';
import 'package:relay/features/dashboard/presentation/dashboard_screen.dart';
import 'package:relay/features/notifications/presentation/notification_screen.dart';
import 'package:relay/features/organization/presentation/organization_screens.dart';
import 'package:relay/features/settings/presentation/settings_screen.dart';
import 'package:relay/features/tasks/presentation/task_screens.dart';

part 'router.g.dart';

final routerProvider = Provider<GoRouter>((ref) {
  const demoSignedIn = bool.fromEnvironment(
    'RELAY_DEMO_SIGNED_IN',
    defaultValue: true,
  );
  return GoRouter(
    initialLocation: '/',
    routes: $appRoutes,
    redirect: (context, state) {
      final public =
          state.matchedLocation == '/auth' ||
          state.matchedLocation == '/onboarding';
      if (!demoSignedIn && !public) return '/auth';
      if (demoSignedIn && state.matchedLocation == '/auth') return '/';
      return null;
    },
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Page unavailable')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.lock_outline, size: 48),
              const SizedBox(height: 16),
              Text(
                state.error?.toString() ??
                    'This link is invalid or you no longer have access.',
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () => context.go('/'),
                child: const Text('Back to home'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
});

@TypedShellRoute<RelayShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRoute>(path: '/'),
    TypedGoRoute<TasksRoute>(path: '/tasks'),
    TypedGoRoute<InboxRoute>(path: '/inbox'),
    TypedGoRoute<SettingsRoute>(path: '/settings'),
  ],
)
class RelayShellRoute extends ShellRouteData {
  const RelayShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) =>
      AppShell(child: navigator);
}

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DashboardScreen();
}

class TasksRoute extends GoRouteData with $TasksRoute {
  const TasksRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TaskListScreen();
}

class InboxRoute extends GoRouteData with $InboxRoute {
  const InboxRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NotificationScreen();
}

class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsScreen();
}

@TypedGoRoute<AuthRoute>(path: '/auth')
class AuthRoute extends GoRouteData with $AuthRoute {
  const AuthRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const AuthScreen();
}

@TypedGoRoute<OnboardingRoute>(path: '/onboarding')
class OnboardingRoute extends GoRouteData with $OnboardingRoute {
  const OnboardingRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OnboardingScreen();
}

@TypedGoRoute<NewTaskRoute>(path: '/tasks/new')
class NewTaskRoute extends GoRouteData with $NewTaskRoute {
  const NewTaskRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TaskFormScreen();
}

@TypedGoRoute<TaskDetailRoute>(
  path: '/tasks/:taskId',
  routes: <TypedRoute<RouteData>>[TypedGoRoute<EditTaskRoute>(path: 'edit')],
)
class TaskDetailRoute extends GoRouteData with $TaskDetailRoute {
  const TaskDetailRoute({required this.taskId});
  final String taskId;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      TaskDetailScreen(taskId: taskId);
}

class EditTaskRoute extends GoRouteData with $EditTaskRoute {
  const EditTaskRoute({required this.taskId});
  final String taskId;
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      TaskFormScreen(taskId: taskId);
}

@TypedGoRoute<NotificationRoute>(path: '/notifications')
class NotificationRoute extends GoRouteData with $NotificationRoute {
  const NotificationRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NotificationScreen();
}

@TypedGoRoute<MembersRoute>(path: '/organization/members')
class MembersRoute extends GoRouteData with $MembersRoute {
  const MembersRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MembersScreen();
}

@TypedGoRoute<PoliciesRoute>(path: '/organization/policies')
class PoliciesRoute extends GoRouteData with $PoliciesRoute {
  const PoliciesRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PolicyEditorScreen();
}

@TypedGoRoute<AnalyticsRoute>(path: '/analytics')
class AnalyticsRoute extends GoRouteData with $AnalyticsRoute {
  const AnalyticsRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AnalyticsScreen();
}
