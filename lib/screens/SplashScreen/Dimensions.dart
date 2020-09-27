import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/App.dart';
import 'package:invmovieconcept1/configs/AppDimensions.dart';

class Dimensions {
  static double imageSize;

  static init(BuildContext context) {
    App.init(context);

    imageSize = AppDimensions.ratio * 40 + 40;
  }
}
