import 'package:invmovieconcept1/io/io.dart';
import 'dart:math';

import 'package:flutter/foundation.dart';

abstract class Ads {
  static bool _forceTest = false;
  static bool _test = kDebugMode || _forceTest;

  static String getAppId() {
    return "ca-app-pub-9217632370383904~2821189635";
  }

  static String _testBanner() {
    if (Platform.isIOS) return "ca-app-pub-3940256099942544/2934735716";
    return "ca-app-pub-3940256099942544/6300978111";
  }

  static String _testInterstitial() {
    if (Platform.isIOS) {
      const image = "ca-app-pub-3940256099942544/4411468910";
      const video = "ca-app-pub-3940256099942544/5135589807";
      final roll = Random().nextInt(5);
      return roll == 1 ? video : image;
    }
    return "ca-app-pub-3940256099942544/1033173712";
  }

  static String bannerHome() {
    if (_test) return _testBanner();
    return "ca-app-pub-9217632370383904/6416642104";
  }

  static String bannerMovieDetail() {
    if (_test) return _testBanner();
    return "ca-app-pub-9217632370383904/7084652287";
  }
}
