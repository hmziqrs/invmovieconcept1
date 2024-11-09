import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/App.dart';

class Dimensions {
  static late double revealOffset;
  static late double daySelectBox;
  static late double timeSelectBox;
  static late double seatBox;

  static init(BuildContext context) {
    App.init(context);

    seatBox = AppDimensions.ratio * 7 + 16;
    revealOffset = AppDimensions.padding * 30;
    daySelectBox = AppDimensions.ratio * 15 + 30;
    timeSelectBox = AppDimensions.ratio * 10 + 25;
  }
}
