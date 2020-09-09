import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'configs/Theme.dart' as theme;

import 'providers/AppProvider.dart';
import 'AppLocalizations.dart';
import 'screens/HomeScreen/Home.dart';

class AppNavigator extends StatelessWidget {
  AppNavigator(this.observers);
  final List<NavigatorObserver> observers;
  final GlobalKey<NavigatorState> navigator = new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (RawKeyEvent event) {
        if (event.runtimeType == RawKeyDownEvent &&
            event.isAltPressed &&
            event.logicalKey == LogicalKeyboardKey.backspace &&
            this.navigator.currentState.canPop()) {
          this.navigator.currentState.pop();
        }
      },
      child: ChangeNotifierProvider<AppProvider>(
        create: (_) => AppProvider(),
        child: Consumer<AppProvider>(
          builder: (context, value, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: value.activeLocale,
              supportedLocales: AppProvider.locales,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (locale != null &&
                      supportedLocale.languageCode == locale.languageCode &&
                      supportedLocale.countryCode == locale.countryCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
              navigatorKey: this.navigator,
              theme: ThemeData(
                fontFamily: "Muli",
                primaryColor: theme.primary,
                accentColor: theme.primary,
              ),
              navigatorObservers: observers,
              home: HomeScreen(),
              routes: <String, WidgetBuilder>{
                "home": (ctx) => HomeScreen(),
              },
            );
          },
        ),
      ),
    );
  }
}
