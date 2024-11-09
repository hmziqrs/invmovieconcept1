import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/App.dart';
import 'package:invmovieconcept1/configs/AppDimensions.dart';

class Dimensions {
  static late double projectCardWidth;
  static late double projectCardHeight;

  static late double avatarRadius;

  static init(BuildContext context) {
    App.init(context);

    projectCardHeight = 80 + AppDimensions.ratio * 60;
    projectCardWidth = 150 + AppDimensions.ratio * 80;

    avatarRadius = 150 + AppDimensions.ratio * 60;
  }
}
