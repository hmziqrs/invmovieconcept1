import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'native/Cache.dart';

import 'Navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cache.init();
  final analyticsObserver = FirebaseAnalyticsObserver(
    analytics: FirebaseAnalytics(),
  );

  FlutterError.onError = (FlutterErrorDetails err) {
    FirebaseCrashlytics.instance.recordFlutterError(err);
  };
  runApp(AppNavigator([analyticsObserver]));
}
