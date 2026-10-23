import 'package:flutter/material.dart';
import 'package:relay/design_system/tokens.dart';

abstract final class RelayTheme {
  static ThemeData light() => _build(
    ColorScheme.fromSeed(
      seedColor: RelayColors.cobalt,
      brightness: Brightness.light,
      surface: const Color(0xFFFAF9F7),
    ),
  );

  static ThemeData dark() => _build(
    ColorScheme.fromSeed(
      seedColor: const Color(0xFF85ADFF),
      brightness: Brightness.dark,
      surface: const Color(0xFF121418),
    ),
  );

  static ThemeData _build(ColorScheme scheme) {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      visualDensity: VisualDensity.standard,
    );
    final textTheme = base.textTheme.copyWith(
      displayLarge: base.textTheme.displayLarge?.copyWith(
        fontFamily: 'BricolageGrotesque',
      ),
      displayMedium: base.textTheme.displayMedium?.copyWith(
        fontFamily: 'BricolageGrotesque',
      ),
      displaySmall: base.textTheme.displaySmall?.copyWith(
        fontFamily: 'BricolageGrotesque',
      ),
      headlineLarge: base.textTheme.headlineLarge?.copyWith(
        fontFamily: 'BricolageGrotesque',
      ),
      headlineMedium: base.textTheme.headlineMedium?.copyWith(
        fontFamily: 'BricolageGrotesque',
      ),
      headlineSmall: base.textTheme.headlineSmall?.copyWith(
        fontFamily: 'BricolageGrotesque',
      ),
      titleLarge: base.textTheme.titleLarge?.copyWith(
        fontFamily: 'BricolageGrotesque',
      ),
    );
    return base.copyWith(
      textTheme: textTheme,
      scaffoldBackgroundColor: scheme.surface,
      dividerTheme: DividerThemeData(color: scheme.outlineVariant, space: 1),
      cardTheme: CardThemeData(
        elevation: 0,
        color: scheme.surfaceContainerLow,
        shape: const RoundedRectangleBorder(borderRadius: RelayRadii.panel),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerLow,
        border: const OutlineInputBorder(borderRadius: RelayRadii.control),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: scheme.inverseSurface,
        contentTextStyle: TextStyle(color: scheme.onInverseSurface),
      ),
      navigationBarTheme: const NavigationBarThemeData(height: 72),
      navigationRailTheme: const NavigationRailThemeData(
        minWidth: 80,
        labelType: NavigationRailLabelType.all,
      ),
    );
  }
}
