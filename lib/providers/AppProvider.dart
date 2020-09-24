import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeMap = {
  "system": ThemeMode.system,
  "dark": ThemeMode.dark,
  "light": ThemeMode.light,
};

class AppProvider extends ChangeNotifier {
  static List<Locale> locales = [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
    Locale('ar', 'SA'),
  ];
  SharedPreferences _prefs;

  Locale _activeLocale;

  bool _loading = true;
  bool _init = false;
  ThemeMode _themeMode = ThemeMode.system;

  Locale get activeLocale => this._activeLocale;
  bool get loading => this._loading;
  bool get init => this._init;
  ThemeMode get themeMode => this._themeMode;

  set activeLocale(Locale newLocale) {
    this._activeLocale = newLocale;
    notifyListeners();
  }

  void initApp() {
    if (this._init) {
      return;
    }
    this._init = true;
    notifyListeners();
    this._initTheme();
  }

  void _initTheme() async {
    await Future.delayed(Duration(milliseconds: 100));
    this._prefs = await SharedPreferences.getInstance();
    final theme = this._prefs.getString("theme");
    this._themeMode = themeMap[theme];
    this._loading = false;
    await Future.delayed(Duration(milliseconds: 4000));
    notifyListeners();
  }

  void setTheme(ThemeMode newTheme) {
    this._themeMode = newTheme;
    notifyListeners();
    this._prefs.setString("theme", newTheme.toString().split(".").last);
  }
}
