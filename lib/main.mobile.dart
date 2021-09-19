import 'package:flutter/material.dart';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_analytics/observer.dart';

import 'configs/Ads.dart';
import 'native/Cache.dart';

import 'configs/App.dart';

import 'Navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseCrashlytics _firebaseCrashlytics;
  _firebaseCrashlytics = FirebaseCrashlytics.instance;
  await Cache.init();

  App.showAds = true;

  if (App.showAds) {
    Admob.initialize(testDeviceIds: [Ads.getAppId()]);
  }

  final analyticsObserver = FirebaseAnalyticsObserver(
    analytics: FirebaseAnalytics(),
  );

  FlutterError.onError = (FlutterErrorDetails err) {
    _firebaseCrashlytics.recordFlutterError(err);
  };
  runApp(AppNavigator([analyticsObserver]));
}
