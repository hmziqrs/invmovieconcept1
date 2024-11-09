import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/App.dart';
import 'package:invmovieconcept1/configs/Theme.dart' as theme;
import 'package:tinycolor2/tinycolor2.dart';

abstract class HomeTheme {
  static late Color background;
  static late Color text;
  static late Color shadowWithBg;

  static late Color tagsBackground;
  static late Color tagsShadow;

  static late Color homeImageBg;
  static late double homeImageBgOpacity;

  static init() {
    background = Colors.white;
    text = Colors.black;
    shadowWithBg = Colors.black.withOpacity(0.12);

    tagsBackground = TinyColor.fromColor(Colors.black).lighten(96).color;
    tagsShadow = Colors.black.withOpacity(0.12);

    homeImageBg = Colors.white;
    homeImageBgOpacity = 0.70;

    if (App.isDark()) {
      background = theme.darkBackground;
      text = Colors.white;
      shadowWithBg = Colors.white.withOpacity(0.16);

      tagsBackground = TinyColor.fromColor(Colors.black).lighten(20).color;
      tagsShadow = Colors.black.withOpacity(0.4);

      homeImageBg = Colors.black;
      homeImageBgOpacity = 0.75;
    }
  }
}
