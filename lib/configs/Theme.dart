import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';

final primary = Pigment.fromString("#cc2f2c");
final background = Pigment.fromString('#f5eee6');
final background2 = Pigment.fromString('#f6eee6');

final darkBackground = Pigment.fromString('#1c1c1e');

final subText = Pigment.fromString('#1c1d24').withOpacity(0.6);
final indicator = Pigment.fromString('#1c1d24').withOpacity(0.4);

final base = ThemeData(
  brightness: Brightness.light,
  fontFamily: "Muli",
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: primary,
  accentColor: primary,
  splashColor: Colors.transparent,
);
