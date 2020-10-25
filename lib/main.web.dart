import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'native/Cache.dart';

import 'Navigator.dart';

void main() async {
  await Cache.init();
  final analyticsObeserver = FirebaseAnalyticsObserver(
    analytics: FirebaseAnalytics(),
  );

  Crashlytics.instance.enableInDevMode = true;

  FlutterError.onError = (FlutterErrorDetails err) {
    Crashlytics.instance.recordFlutterError(err);
  };
  runApp(AppNavigator([analyticsObeserver]));
}
