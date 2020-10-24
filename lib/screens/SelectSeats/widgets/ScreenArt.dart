import 'package:flutter/material.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';

import 'ScreenArtClipper.dart';
import 'SSReveal.dart';

class ScreenArt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SSReveal(
      delay: 450,
      child: Align(
        // alignment: Alignment.center,
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.005)
            ..rotateX(0.9),
          alignment: FractionalOffset.center,
          child: ClipPath(
            clipper: ScreenArtClipper(),
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppTheme.accent,
                    AppTheme.accent.withOpacity(0.001),
                  ],
                ),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 8,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
