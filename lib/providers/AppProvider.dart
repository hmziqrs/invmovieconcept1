import 'package:flutter/material.dart';
import 'package:invmovieconcept1/native/Cache.dart';
import 'package:provider/provider.dart';

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
  static AppProvider state(BuildContext context, [bool listen = false]) =>
      Provider.of<AppProvider>(context, listen: listen);

  AppProvider() {
    this._initAsync();
  }

  static List<Locale> locales = [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
    Locale('ar', 'SA'),
  ];

  Locale _activeLocale;

  bool _loading = true;
  ThemeMode _themeMode = ThemeMode.system;

  Locale get activeLocale => this._activeLocale;
  bool get loading => this._loading;
  ThemeMode get themeMode => this._themeMode;

  set activeLocale(Locale newLocale) {
    this._activeLocale = newLocale;
    notifyListeners();

    Cache.ins.setStringList(
      CacheKeys.locale.toString(),
      newLocale == null ? [] : newLocale.toString().split("_"),
    );
  }

  void _initAsync() async {
    await Future.delayed(Duration(milliseconds: 100));

    // if (Cache.ins == null) {
    //   Cache.ins = await SharedPreferences.getInstance();
    // }

    final cachedTheme = Cache.ins.getString(CacheKeys.theme.toString());
    this._themeMode =
        cachedTheme == null ? themeMap["system"] : themeMap[cachedTheme];

    final cachedLocale = Cache.ins.getStringList(CacheKeys.locale.toString());
    if (cachedLocale != null && cachedLocale.isNotEmpty) {
      this._activeLocale = Locale(cachedLocale.first, cachedLocale.last);
    }

    await Future.delayed(Duration(milliseconds: 1000));
    this._loading = false;
    notifyListeners();
  }

  void setTheme(ThemeMode newTheme) {
    if (this._themeMode == newTheme) {
      return;
    }
    this._themeMode = newTheme;
    notifyListeners();
    Cache.ins.setString(
      CacheKeys.theme.toString(),
      newTheme.toString().split(".").last,
    );
  }
}
