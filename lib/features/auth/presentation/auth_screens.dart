import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

final class _AuthScreenState extends State<AuthScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(32),
              shrinkWrap: true,
              children: [
                Text(
                  'Relay',
                  style: Theme.of(context).textTheme.displaySmall
                      ?.copyWith(fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 8),
                Text(
                  'Keep delegated work moving, with every escalation explained.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                  decoration: const InputDecoration(labelText: 'Work email'),
                  validator: (value) => (value?.contains('@') ?? false)
                      ? null
                      : 'Enter a valid email.',
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  autofillHints: const [AutofillHints.password],
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (value) => (value?.length ?? 0) >= 8
                      ? null
                      : 'Use at least 8 characters.',
                ),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: _continue,
                  child: const Text('Continue with email'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: _continue,
                  icon: const Icon(Icons.g_mobiledata),
                  label: const Text('Continue with Google'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: _continue,
                  icon: const Icon(Icons.apple),
                  label: const Text('Continue with Apple'),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  void _continue() {
    if (email.text.isNotEmpty && !(formKey.currentState?.validate() ?? false)) {
      return;
    }
    context.go('/onboarding');
  }
}

final class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Set up Relay')),
    body: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 640),
        child: ListView(
          padding: const EdgeInsets.all(24),
          shrinkWrap: true,
          children: [
            Text(
              'Bring your team together',
              style: Theme.of(context).textTheme.headlineMedium
                  ?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            const Text(
              'Create an organization or join one using an invite link or code.',
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => context.go('/'),
              icon: const Icon(Icons.add_business),
              label: const Text('Create organization'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => _inviteDialog(context),
              icon: const Icon(Icons.link),
              label: const Text('Join with invite'),
            ),
          ],
        ),
      ),
    ),
  );

  Future<void> _inviteDialog(BuildContext context) => showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Join an organization'),
      content: const TextField(
        decoration: InputDecoration(labelText: 'Invite link or code'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(context);
            context.go('/');
          },
          child: const Text('Join'),
        ),
      ],
    ),
  );
}
