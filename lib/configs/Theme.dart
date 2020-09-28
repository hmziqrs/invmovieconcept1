import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';

final primary = Pigment.fromString("#cc2f2c");
final background = Pigment.fromString('#f5eee6');
final background2 = Pigment.fromString('#f6eee6');

final darkBackground = Pigment.fromString('#1c1c1e');

final subText = Pigment.fromString('#1c1d24').withOpacity(0.6);
final indicator = Pigment.fromString('#1c1d24').withOpacity(0.4);

final base = ThemeData(
  fontFamily: 'Muli',
  accentColor: primary,
  primaryColor: primary,
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.white,
);

final baseDark = ThemeData(
  fontFamily: 'Muli',
  accentColor: primary,
  primaryColor: primary,
  brightness: Brightness.dark,
  backgroundColor: darkBackground,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: darkBackground,
);
