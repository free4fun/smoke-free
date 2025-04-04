// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Libre de Humo';

  @override
  String get registerConsumption => 'Registrar Consumo';

  @override
  String cigaretteLogged(Object time) {
    return 'Cigarrillo registrado a las $time';
  }

  @override
  String get statistics => 'Estadísticas';

  @override
  String get settings => 'Configuración';
}
