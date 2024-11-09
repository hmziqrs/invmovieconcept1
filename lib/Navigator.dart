import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'configs/Scroll.dart';
import 'configs/Theme.dart' as theme;

import 'providers/Reservation.dart';
import 'providers/AppProvider.dart';

import 'screens/AboutDeveloper/AboutDeveloper.dart';
import 'screens/AboutDesigner/AboutDesigner.dart';
import 'screens/MovieDetail/MovieDetail.dart';
import 'screens/SelectSeats/SelectSeats.dart';
import 'screens/Reservation/Reservation.dart';
import 'screens/MyMovies/MyMovies.dart';
import 'screens/Download/Download.dart';
import 'screens/Search/Search.dart';
import 'screens/Splash/Splash.dart';
import 'screens/Home/Home.dart';

import 'AppLocalizations.dart';

class AppNavigator extends StatelessWidget {
  AppNavigator(this.observers);
  final List<NavigatorObserver> observers;
  final GlobalKey<NavigatorState> navigator = new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKeyEvent: (KeyEvent event) {
        final canPop = this.navigator.currentState?.canPop() ?? false;
        if (event is KeyDownEvent) {
          // if alt and backspace are pressed
          var check = HardwareKeyboard.instance.isAltPressed &&
            event.logicalKey == LogicalKeyboardKey.backspace &&
              canPop;
          if (!check) return;
          this.navigator.currentState?.pop();
        }
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppProvider()),
          ChangeNotifierProvider(create: (_) => ReservationProvider()),
        ],
        child: Consumer<AppProvider>(
          builder: (context, value, _) {
            return MaterialChild(
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

class MaterialChild extends StatelessWidget {
  MaterialChild({
    required this.navigatorKey,
    required this.observers,
    required this.state,
  });
  final List<NavigatorObserver> observers;
  final GlobalKey<NavigatorState> navigatorKey;
  final AppProvider state;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          MaterialApp(
            scrollBehavior: AppScrollBehavior().copyWith(scrollbars: false),
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
            theme: theme.base,
            darkTheme: theme.baseDark,
            themeMode: this.state.themeMode,
            // Routes
            initialRoute: "home",
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case 'search':
                  return PageTransition(
                    settings: settings,
                    child: SearchScreen(),
                    type: PageTransitionType.fade,
                  );
                case 'movieDetail':
                  return PageTransition(
                    settings: settings,
                    child: MovieDetailScreen(),
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 700),
                  );
                case 'selectSeats':
                  return PageTransition(
                    settings: settings,
                    child: SelectSeatsScreen(),
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 700),
                  );
                case 'reservation':
                  return PageTransition(
                    settings: settings,
                    child: ReservationScreen(),
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 700),
                  );
                default:
                  return null;
              }
            },
            routes: <String, WidgetBuilder>{
              "home": (ctx) => HomeScreen(),
              "download": (ctx) => DownloadScreen(),
              "myMovies": (ctx) => MyMoviesScreen(),
              "aboutDesigner": (ctx) => AboutDesignerScreen(),
              "aboutDeveloper": (ctx) => AboutDeveloperScreen(),
            },
          ),
          SplashScreen(loading: this.state.loading),
        ],
      ),
    );
  }
}
