import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/App.dart';
import 'package:invmovieconcept1/configs/AppDimensions.dart';

class Dimensions {
  static late late double projectCardWidth;
  static late late double projectCardHeight;

  static late late double avatarRadius;

  static late init(BuildContext context) {
    App.init(context);

    projectCardHeight = 80 + AppDimensions.ratio * 60;
    projectCardWidth = 150 + AppDimensions.ratio * 80;

    avatarRadius = 150 + AppDimensions.ratio * 60;
  }
}
