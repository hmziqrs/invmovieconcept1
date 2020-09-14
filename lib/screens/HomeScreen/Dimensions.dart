import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/App.dart';
import 'package:invmovieconcept1/UI.dart';

class Dimensions {
  static double containerWidth;
  static double containerHeight;
  static double containerHeightMin;
  static double containerHeightMax;

  static double bgHeight;
  static double bgHeightMax;

  static double cardHeight;
  static double cardWidth;

  static double ratingRadius;

  static init(BuildContext context) {
    App.init(context);

    bgHeight = UI.height * 0.86;
    bgHeightMax = AppDimensions.ratio * 240 + 120;
    bgHeightMax = AppDimensions.ratio * 240 + 120;
    if (bgHeight > bgHeightMax) {
      bgHeight = bgHeightMax;
    }

    cardHeight = AppDimensions.ratio * 100 + 80;
    cardWidth = cardHeight * 0.75;

    ratingRadius = (AppDimensions.ratio * 24) + 24;

    containerWidth = UI.width;
    if (UI.width > 540) {
      containerWidth = 540;
    }

    containerHeight = UI.height;

    final ratingsSpace = bgHeight +
        (Dimensions.ratingRadius / 2 + AppDimensions.padding * (4 + 9));

    if (ratingsSpace > containerHeight) {
      containerHeight = ratingsSpace;
    }
  }
}
