import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:invmovieconcept1/firebase_options.dart';

import 'Utils.dart';
import 'native/Cache.dart';

import 'configs/App.dart';

import 'Navigator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // AppFCM.init();
  await Cache.init();

  App.showAds = Utils.isMobile();
  if (App.showAds) {
    await MobileAds.instance.initialize();
  }

  final List<NavigatorObserver> observers = [
    FirebaseAnalyticsObserver(
      analytics: FirebaseAnalytics.instance,
    )
  ];

  FlutterError.onError = (FlutterErrorDetails err) {
    FirebaseCrashlytics.instance.recordFlutterError(err);
  };

  runApp(AppNavigator(observers));
}
