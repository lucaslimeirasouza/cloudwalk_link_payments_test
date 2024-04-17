import 'package:intl/intl.dart';

class Settings {
  static final Settings instance = Settings._injector();

  Settings._injector();

  String get currencySymbol {
    return NumberFormat().simpleCurrencySymbol(NumberFormat().currencySymbol);
  }
}
