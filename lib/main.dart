import 'package:flutter/material.dart';


import 'package:invmovieconcept1/Navigator.dart';
import 'package:invmovieconcept1/configs/App.dart';

import 'native/Cache.dart';

void main(List<String> args) {
  _main(null);
}

void mainTest(NavigatorObserver? observer) {
  _main(observer);
}

void _main(NavigatorObserver? observer) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cache.init();
  App.showAds = false;

  final List<NavigatorObserver> observers = [];

  if (observer != null) observers.add(observer);

  runApp(AppNavigator(observers));
}
