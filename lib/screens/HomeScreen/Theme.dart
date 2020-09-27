import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/App.dart';
import 'package:invmovieconcept1/configs/Theme.dart' as theme;
import 'package:tinycolor/tinycolor.dart';

abstract class HomeTheme {
  static Color background;
  static Color text;
  static Color shadowWithBg;

  static Color tagsBackground;
  static Color tagsShadow;

  static Color homeImageBg;
  static double homeImageBgOpacity;

  static init() {
    background = Colors.white;
    text = Colors.black;
    shadowWithBg = Colors.black.withOpacity(0.12);

    tagsBackground = TinyColor(Colors.black).lighten(96).color;
    tagsShadow = Colors.black.withOpacity(0.12);

    homeImageBg = Colors.white;
    homeImageBgOpacity = 0.70;

    if (App.isDark()) {
      background = theme.darkBackground;
      text = Colors.white;
      shadowWithBg = Colors.white.withOpacity(0.12);

      tagsBackground = TinyColor(Colors.black).lighten(20).color;
      tagsShadow = Colors.black.withOpacity(0.4);

      homeImageBg = Colors.black;
      homeImageBgOpacity = 0.75;
    }
  }
}
