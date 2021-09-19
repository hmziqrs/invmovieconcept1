import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'native/Cache.dart';

import 'Navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseCrashlytics _firebaseCrashlytics;
  _firebaseCrashlytics = FirebaseCrashlytics.instance;
  await Cache.init();
  final analyticsObeserver = FirebaseAnalyticsObserver(
    analytics: FirebaseAnalytics(),
  );

  FlutterError.onError = (FlutterErrorDetails err) {
    _firebaseCrashlytics.recordFlutterError(err);
  };
  runApp(AppNavigator([analyticsObeserver]));
}
