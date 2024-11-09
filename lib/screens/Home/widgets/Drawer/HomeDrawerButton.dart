import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:supercharged/supercharged.dart';

enum AnimProp { opacity }

class HomeDrawerButton extends StatelessWidget {
  HomeDrawerButton({
    required this.entry,
    required this.onPressed,
    required this.baseAnimation,
  });

  final double baseAnimation;
  final VoidCallback onPressed;
  final MapEntry<int, Map<String, Object>> entry;

  @override
  Widget build(BuildContext context) {
    final tween2 = MovieTween();
    tween2
        .tween(
          AnimProp.opacity.toString(),
          ConstantTween(0.0),
          duration: 100.milliseconds,
        )
        .thenTween(
          AnimProp.opacity.toString(),
          Tween(begin: 0.0, end: 1.0),
          duration: (200 + (15 * entry.key)).milliseconds,
        );

    return CustomAnimationBuilder<Movie>(
      tween: tween2,
      control: baseAnimation > 0.8
          ? Control.play : Control.playReverse,
      duration: tween2.duration,
      builder: (context, button, _) {
        return Opacity(
          opacity: button.get(AnimProp.opacity),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: AppDimensions.padding * 2,
            ),
            child: ElevatedButton(
              key: Key(entry.value["key"].toString()),
              onPressed: this.onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              child: Text(
                "Yooo", // TODO
                // App.translate(entry.value["label"]!, context),
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
