import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invmovieconcept1/screens/SplashScreen/Home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'configs/Theme.dart' as theme;

import 'providers/AppProvider.dart';

import 'screens/HomeScreen/Home.dart';

import 'AppLocalizations.dart';

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
            return MaterialChlid(
              state: value,
              observers: this.observers,
              navigatorKey: this.navigator,
            );
          },
        ),
      ),
    );
  }
}

class MaterialChlid extends StatelessWidget {
  MaterialChlid({
    @required this.navigatorKey,
    @required this.observers,
    @required this.state,
  });
  final List<NavigatorObserver> observers;
  final GlobalKey<NavigatorState> navigatorKey;
  final AppProvider state;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      this.state.initApp();
    });

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          MaterialApp(
            debugShowCheckedModeBanner: false,
            supportedLocales: AppProvider.locales,
            navigatorKey: this.navigatorKey,
            navigatorObservers: observers,
            // Locales
            locale: this.state.activeLocale,
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
            // Theme
            themeMode: this.state.themeMode,
            darkTheme: theme.base.copyWith(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: theme.darkBackground,
              textTheme: theme.base.textTheme.copyWith(
                bodyText1: theme.base.textTheme.bodyText1.copyWith(
                  color: Colors.white,
                ),
              ),
              iconTheme: theme.base.iconTheme.copyWith(
                color: Colors.white,
              ),
            ),
            theme: theme.base,
            // Routes
            home: HomeScreen(),
            routes: <String, WidgetBuilder>{
              "home": (ctx) => HomeScreen(),
            },
          ),
          SplashScreen(loading: this.state.loading),
        ],
      ),
    );
  }
}
