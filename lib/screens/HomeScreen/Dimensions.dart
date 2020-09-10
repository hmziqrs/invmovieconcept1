import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/App.dart';
import 'package:invmovieconcept1/UI.dart';

class Dimensions {
  static double bgHeight;
  static double cardHeight;
  static double cardWidth;
  static double containerWidth;

  static init(BuildContext context) {
    App.init(context);

    bgHeight = UI.safeHeight * 0.90;
    cardHeight = AppDimensions.ratio * 100 + 80;
    cardWidth = cardHeight * 0.75;

    containerWidth = UI.width;
    if (UI.width > 480) {
      containerWidth = 480;
    }
  }
}
