import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/App.dart';
import 'package:invmovieconcept1/UI.dart';

class Dimensions {
  static double buttonWidth;

  static init(BuildContext context) {
    App.init(context);
    buttonWidth = double.infinity;

    if (UI.sm) {
      buttonWidth = 200;
    }
  }
}
