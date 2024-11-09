import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/App.dart';

class Dimensions {
  static late double cardHeight;
  static late double cardWidth;

  static late double modalWidth;

  static init(BuildContext context) {
    App.init(context);

    cardHeight = AppDimensions.ratio * 70 + 150;
    cardWidth = cardHeight * 0.72;

    modalWidth = AppDimensions.ratio * 60 + 150;
  }
}
