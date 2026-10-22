import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:relay/app/app.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('accepts a critical assignment from the dashboard', (
    tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: RelayApp()));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Accept'));
    await tester.pumpAndSettle();
    expect(find.text('Restore checkout webhook'), findsWidgets);
  });
}
