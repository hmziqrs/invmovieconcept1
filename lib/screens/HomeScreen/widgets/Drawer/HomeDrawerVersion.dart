import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';

import '../../Theme.dart';

class HomeDrawerVersion extends StatelessWidget {
  HomeDrawerVersion({
    @required this.baseAnimation,
  });

  final double baseAnimation;

  @override
  Widget build(BuildContext context) {
    return CustomAnimation<double>(
      control: baseAnimation > 0.95
          ? CustomAnimationControl.PLAY
          : CustomAnimationControl.PLAY_REVERSE,
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 320),
      builder: (context, _, double opacity) {
        return Opacity(
          opacity: opacity,
          child: Container(
            margin: EdgeInsets.only(
              top: AppDimensions.padding * 2,
            ),
            alignment: Alignment.center,
            child: Text(
              "VERSION 2.0.0",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: HomeTheme.text.withOpacity(0.3),
                fontSize: (AppDimensions.ratio * 5) + 5,
              ),
            ),
          ),
        );
      },
    );
  }
}
