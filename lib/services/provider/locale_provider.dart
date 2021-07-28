import 'package:bluestacks_flutter_assigment/l10n/l10n.dart';
import 'package:bluestacks_flutter_assigment/services/exports/home_imports.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    if(!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}