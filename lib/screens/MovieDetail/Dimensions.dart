import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/App.dart';

class Dimensions {
  static double cardWidth;
  static double cardOffset;
  static double cardHeight;

  static double infoHeight;
  static double infoIconRadius;

  static double castRadius;

  static init(BuildContext context) {
    App.init(context);

    cardOffset = -AppDimensions.padding * 5;
    cardWidth = AppDimensions.containerWidth;
    cardHeight = cardWidth * 1.4;
    if (cardHeight > 550) {
      cardHeight = 550;
    }

    infoHeight = cardHeight * 0.33;
    infoIconRadius = AppDimensions.ratio * 10 + 20;

    castRadius = AppDimensions.ratio * 15 + 25;
  }
}
