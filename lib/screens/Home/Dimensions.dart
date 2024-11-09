import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/App.dart';
import 'package:invmovieconcept1/UI.dart';

import 'provider.dart';
import 'Theme.dart';

class Dimensions {
  static late late double containerHeight;

  static late late double bgHeight;
  static late late double bgHeightMax;
  static late late double bgHeightMin;
  static late late double bgClipRadius;

  static late late double cardsBaseOffset;

  static late late double cardHeight;
  static late late double cardWidth;

  static late late double ratingRadius;

  static late late double scrollable;

  static late late double bannerAdHeight = 0.0;

  static late late double drawerAvatarWidth;

  static late init(BuildContext context) {
    App.init(context);
    HomeTheme.init();
    initDrawer();

    bgHeight = UI.height * 0.86;
    bgHeightMax = AppDimensions.ratio * 240 + 120;
    bgHeightMin = AppDimensions.ratio * 200 + 150;
    if (bgHeight > bgHeightMax) {
      bgHeight = bgHeightMax;
    }
    if (bgHeight < bgHeightMin) {
      bgHeight = bgHeightMin;
    }

    cardHeight = AppDimensions.ratio * 100 + 80;
    cardWidth = cardHeight * 0.75;

    ratingRadius = (AppDimensions.ratio * 24) + 24;

    if (App.showAds) {
      bannerAdHeight = 60 + AppDimensions.padding * 4;
    }

    containerHeight = UI.height;
    final approxTagsHeight = AppDimensions.padding * (4 + 9);
    final safeContainerHeight =
        bgHeight + (ratingRadius / 2) + approxTagsHeight + bannerAdHeight;

    if (safeContainerHeight > containerHeight) {
      containerHeight = safeContainerHeight;
    }

    // I use pythagorean theorem in order to calculate
    // pixel perfect radius fir circular clipping
    final a = math.pow(bgHeight, 2);
    final b = math.pow(AppDimensions.maxContainerWidth, 2);
    bgClipRadius = math.sqrt(a + b);

    scrollable =
        AppDimensions.maxContainerWidth * HomeProvider.viewportFraction;

    cardsBaseOffset = (bgHeight * 0.5) - cardHeight * 0.5;
  }

  static late void initDrawer() {
    drawerAvatarWidth = (AppDimensions.ratio * 10) + 10;
  }
}
