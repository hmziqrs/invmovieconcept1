import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;

import 'package:invmovieconcept1/Navigator.dart';
import 'package:invmovieconcept1/configs/Ads.dart';
import 'package:invmovieconcept1/configs/App.dart';
import 'package:universal_io/io.dart';

import 'native/Cache.dart';

void main(List<String> args) {
  _main(null);
}

void mainTest(NavigatorObserver observer) {
  _main(observer);
}

void _main(NavigatorObserver observer) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cache.init();
  App.showAds = false;

  // if (Platform.isWindows || Platform.isLinux) {
  //   debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  // }
  final List<NavigatorObserver> observers = [];

  if (observer != null) {
    observers.add(observer);
  }

  runApp(AppNavigator(observers));
}
