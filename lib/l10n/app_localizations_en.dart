// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Relay';

  @override
  String get home => 'Home';

  @override
  String get tasks => 'Tasks';

  @override
  String get inbox => 'Inbox';

  @override
  String get settings => 'Settings';

  @override
  String get nextAction => 'Next action';

  @override
  String get atRisk => 'At risk';

  @override
  String get onTrack => 'On track';

  @override
  String get accept => 'Accept';

  @override
  String get decline => 'Decline';
}
