import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:invmovieconcept1/configs/App.dart';
import 'package:invmovieconcept1/firebase_options.dart';

import 'native/Cache.dart';

import 'Navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cache.init();

  App.showAds = false;
  // AppFCM.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final analyticsObserver = FirebaseAnalyticsObserver(
    analytics: FirebaseAnalytics.instance,
  );

  runApp(AppNavigator([analyticsObserver]));
}
