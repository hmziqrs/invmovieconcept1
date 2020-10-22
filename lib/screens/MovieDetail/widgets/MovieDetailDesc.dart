import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';

import '../Dimensions.dart';

class MovieDetailDesc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAnimation<double>(
      tween: 0.0.tweenTo(1.0),
      delay: 900.milliseconds,
      duration: 400.milliseconds,
      builder: (context, child, animation) {
        return Transform(
          transform: Matrix4.identity()
            ..translate(
              0.0,
              (Dimensions.infoHeight * 0.3) -
                  (animation * (Dimensions.infoHeight * 0.3)),
            ),
          child: Opacity(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.padding * 3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description",
              style: TextStyles.heading3,
            ),
            SizedBox(height: AppDimensions.padding * 1),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry",
              style: TextStyles.body1.copyWith(
                color: AppTheme.subText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
