import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:invmovieconcept1/screens/SelectSeats/SelectSeats.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'configs/Theme.dart' as theme;

import 'providers/AppProvider.dart';

import 'screens/AboutDeveloper/AboutDeveloper.dart';
import 'screens/AboutDesigner/AboutDesigner.dart';
import 'screens/MovieDetail/MovieDetail.dart';
import 'screens/Reservation/Reservation.dart';
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
    @required this.navigatorKey,
    @required this.observers,
    @required this.state,
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
            home: HomeScreen(),
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case 'search':
                  return PageTransition(
                    settings: settings,
                    child: SearchScreen(),
                    type: PageTransitionType.fade,
                  );
                  break;
                case 'movieDetail':
                  return PageTransition(
                    settings: settings,
                    child: MovieDetailScreen(),
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 700),
                  );
                  break;
                case 'selectSeats':
                  return PageTransition(
                    settings: settings,
                    child: SelectSeatsScreen(),
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 700),
                  );
                  break;
                case 'reservation':
                  return PageTransition(
                    settings: settings,
                    child: ReservationScreen(),
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 700),
                  );
                  break;
                default:
                  return null;
              }
            },
            routes: <String, WidgetBuilder>{
              "home": (ctx) => HomeScreen(),
              "download": (ctx) => DownloadScreen(),
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
