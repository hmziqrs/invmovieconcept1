import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/App.dart';

import '../../messages/keys.dart';
import '../../Theme.dart';

class HomeDrawerVersion extends StatelessWidget {
  HomeDrawerVersion({
    required this.baseAnimation,
  });

  final double baseAnimation;

  @override
  Widget build(BuildContext context) {
    return CustomAnimationBuilder<double>(
      control: baseAnimation > 0.95
          ? Control.play : Control.playReverse,
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 320),
      builder: (context, opacity, _) {
        return Opacity(
          opacity: opacity,
          child: Container(
            margin: EdgeInsets.only(
              top: AppDimensions.padding * 2,
            ),
            alignment: Alignment.center,
            child: Text(
              "${App.translate(HomeScreenMessages.version, context)} 3.0.0",
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
