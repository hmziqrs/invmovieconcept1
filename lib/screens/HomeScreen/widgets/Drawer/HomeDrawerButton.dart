import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/App.dart';

enum AnimProp { opacity }

class HomeDrawerButton extends StatelessWidget {
  HomeDrawerButton({
    @required this.baseAnimation,
    @required MapEntry<int, Map<String, String>> this.entry,
  });

  final double baseAnimation;
  final MapEntry<int, Map<String, String>> entry;

  @override
  Widget build(BuildContext context) {
    MultiTween<AnimProp> tween = MultiTween<AnimProp>()
      ..add(
        AnimProp.opacity,
        ConstantTween(0.0),
        Duration(
          milliseconds: 100,
        ),
      )
      ..add(
        AnimProp.opacity,
        Tween(begin: 0.0, end: 1.0),
        Duration(
          milliseconds: 200 + (15 * entry.key),
        ),
      );
    return CustomAnimation<MultiTweenValues<AnimProp>>(
      tween: tween,
      control: baseAnimation > 0.8
          ? CustomAnimationControl.PLAY
          : CustomAnimationControl.PLAY_REVERSE,
      duration: tween.duration,
      builder: (context, _, button) {
        return Opacity(
          opacity: button.get(AnimProp.opacity),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: AppDimensions.padding * 2,
            ),
            child: RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              color: Theme.of(context).primaryColor,
              child: Text(
                App.translate(entry.value["label"], context),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: AppDimensions.ratio * 4 + 6,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
