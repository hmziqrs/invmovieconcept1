import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/App.dart';

class Dimensions {
  static late double cardWidth;
  static late double cardOffset;
  static late double cardHeight;

  static late double infoHeight;
  static late double infoIconRadius;

  static late double castRadius;

  static late double bannerAdHeight;

  static late init(BuildContext context) {
    App.init(context);

    cardOffset = -AppDimensions.padding * 5;
    cardWidth = AppDimensions.maxContainerWidth;
    cardHeight = cardWidth * 1.4;
    if (cardHeight > 550) {
      cardHeight = 550;
    }

    infoHeight = cardHeight * 0.33;
    infoIconRadius = AppDimensions.ratio * 10 + 20;

    castRadius = AppDimensions.ratio * 15 + 25;

    if (App.showAds) {
      bannerAdHeight = 60 + AppDimensions.padding * 4;
    }
  }
}
