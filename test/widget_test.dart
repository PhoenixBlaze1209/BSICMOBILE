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

  testWidgets('compact dashboard tolerates 200 percent text scaling', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = 2;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
      tester.platformDispatcher.clearTextScaleFactorTestValue();
    });

    await tester.pumpWidget(const ProviderScope(child: RelayApp()));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('Restore checkout webhook'), findsWidgets);
  });
}
