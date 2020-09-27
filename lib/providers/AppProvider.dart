import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeMap = {
  "system": ThemeMode.system,
  "dark": ThemeMode.dark,
  "light": ThemeMode.light,
};

enum CacheKeys {
  theme,
  locale,
}

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

    this._prefs.setStringList(
          CacheKeys.locale.toString(),
          newLocale == null ? [] : newLocale.toString().split("_"),
        );
  }

  void initApp() {
    if (this._init) {
      return;
    }
    this._init = true;
    notifyListeners();
    this._initAsync();
  }

  void _initAsync() async {
    await Future.delayed(Duration(milliseconds: 100));
    if (this._prefs == null) {
      this._prefs = await SharedPreferences.getInstance();
    }
    final cachedTheme = this._prefs.getString(CacheKeys.theme.toString());
    this._themeMode =
        cachedTheme == null ? themeMap["system"] : themeMap[cachedTheme];
    final cachedLocale = this._prefs.getStringList(CacheKeys.locale.toString());
    if (cachedLocale != null && cachedLocale.isNotEmpty) {
      this._activeLocale = Locale(cachedLocale.first, cachedLocale.last);
    }

    await Future.delayed(Duration(milliseconds: 1000));
    this._loading = false;
    notifyListeners();
  }

  void setTheme(ThemeMode newTheme) {
    this._themeMode = newTheme;
    notifyListeners();
    this._prefs.setString(
          CacheKeys.theme.toString(),
          newTheme.toString().split(".").last,
        );
  }
}
