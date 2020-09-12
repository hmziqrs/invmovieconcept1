import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/App.dart';
import 'package:invmovieconcept1/UI.dart';

class Dimensions {
  static double containerWidth;

  static double bgHeight;
  static double bgHeightMax;

  static double cardHeight;
  static double cardWidth;

  static init(BuildContext context) {
    App.init(context);

    bgHeight = UI.safeHeight * 0.90;
    bgHeightMax = AppDimensions.ratio * 240 + 120;
    if (bgHeight > bgHeightMax) {
      bgHeight = bgHeightMax;
    }

    cardWidth = cardHeight * 0.75;
    cardHeight = AppDimensions.ratio * 100 + 80;

    containerWidth = UI.width;
    if (UI.width > 480) {
      containerWidth = 480;
    }
  }
}
