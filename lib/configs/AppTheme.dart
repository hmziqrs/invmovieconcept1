import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

class AppTheme {
  static BuildContext ctx;

  static Color cardBg;

  static Color lightShadow;
  static Color lightShadow2;

  static Color subText;
  static Color subText2;
  static Color subText3;

  // Consts
  static final TinyColor dark = TinyColor.fromString('#333');
  static final TinyColor light = TinyColor.fromString('#fdfdfd');

  // Init
  static init(BuildContext context) {
    AppTheme.ctx = context;

    lightShadow = Colors.black.withOpacity(0.09);
    lightShadow2 = Colors.black.withOpacity(0.05);
    cardBg = TinyColor.fromString("#f3f3f3").color;

    subText = Colors.black.withOpacity(0.70);
    subText2 = Colors.black.withOpacity(0.60);
    subText3 = Colors.black.withOpacity(0.40);

    if (isDark()) {
      lightShadow = Colors.black.withOpacity(0.30);
      lightShadow2 = Colors.black.withOpacity(0.25);

      subText = Colors.white.withOpacity(0.70);
      subText2 = Colors.white.withOpacity(0.60);
      subText3 = Colors.white.withOpacity(0.40);
    }
  }

  static bool isDark([BuildContext ctx]) =>
      Theme.of(ctx ?? AppTheme.ctx).brightness == Brightness.dark;
}
