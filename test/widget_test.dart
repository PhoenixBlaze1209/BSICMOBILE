import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:relay/app/app.dart';

void main() {
  testWidgets('dashboard exposes the urgent action and navigation', (
    tester,
  ) async {
    await tester.pumpWidget(const ProviderScope(child: RelayApp()));
    await tester.pumpAndSettle();
    expect(find.text('Next action'), findsOneWidget);
    expect(find.text('Restore checkout webhook'), findsWidgets);
    expect(
      find.byWidgetPredicate(
        (widget) => widget is NavigationBar || widget is NavigationRail,
      ),
      findsOneWidget,
    );
    expect(find.text('Accept'), findsOneWidget);
  });
}
