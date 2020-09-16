import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_performance/firebase_performance.dart';

import 'Navigator.dart';
import 'configs/Ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize(Ads.getAppId());

  final analyticsObeserver = FirebaseAnalyticsObserver(
    analytics: FirebaseAnalytics(),
  );
  Crashlytics.instance.enableInDevMode = true;

  FlutterError.onError = (FlutterErrorDetails err) {
    Crashlytics.instance.recordFlutterError(err);
  };

  runApp(AppNavigator([analyticsObeserver]));
}
