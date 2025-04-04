// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Smoke Free';

  @override
  String get registerConsumption => 'Register Consumption';

  @override
  String cigaretteLogged(Object time) {
    return 'Cigarette logged at $time';
  }

  @override
  String get statistics => 'Statistics';

  @override
  String get settings => 'Settings';
}
