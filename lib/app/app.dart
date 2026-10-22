import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relay/app/router.dart';
import 'package:relay/design_system/relay_theme.dart';
import 'package:relay/l10n/app_localizations.dart';

final class RelayApp extends ConsumerWidget {
  const RelayApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
    title: 'Relay',
    debugShowCheckedModeBanner: false,
    theme: RelayTheme.light(),
    darkTheme: RelayTheme.dark(),
    themeMode: ThemeMode.system,
    routerConfig: ref.watch(routerProvider),
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
  );
}
