import 'package:flutter/material.dart';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_analytics/observer.dart';

import 'native/Cache.dart';

import 'configs/Ads.dart';
import 'configs/App.dart';

import 'Navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cache.init();

  App.showAds = false;

  if (App.showAds) {
    Admob.initialize(Ads.getAppId());
  }

  final analyticsObserver = FirebaseAnalyticsObserver(
    analytics: FirebaseAnalytics(),
  );

  Crashlytics.instance.enableInDevMode = true;

  FlutterError.onError = (FlutterErrorDetails err) {
    Crashlytics.instance.recordFlutterError(err);
  };
  runApp(AppNavigator([analyticsObserver]));
}
