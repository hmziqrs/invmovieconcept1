import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';

class MovieDetailSelectSeats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
      tween: 1.0.tweenTo(0.0),
      delay: 200.milliseconds,
      duration: 400.milliseconds,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.background.withOpacity(0.001),
              AppTheme.background,
            ],
          ),
        ),
        padding: EdgeInsets.only(
          top: AppDimensions.padding * 3,
          left: AppDimensions.padding * 3,
          right: AppDimensions.padding * 3,
          bottom: AppDimensions.padding * 3,
        ),
        child: RaisedButton(
          onPressed: () {},
          color: AppTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Text(
            "Select Seats",
            style: TextStyles.body17.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
      builder: (ctx, child, animation) {
        return Positioned(
          left: 0,
          right: 0,
          bottom: -AppDimensions.padding * 16 * animation,
          child: child,
        );
      },
    );
  }
}
