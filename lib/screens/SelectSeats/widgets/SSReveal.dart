import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';

import '../Dimensions.dart';
import '../provider.dart';

class SSReveal extends StatelessWidget {
  SSReveal({
    required this.delay,
    required this.child,
  });

  final int delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Selector<SelectSeatsProvider, bool>(
      selector: (ctx, state) => state.fadeOff,
      builder: (context, fadeOff, child) {
        return CustomAnimation<double>(
          tween: 0.0.tweenTo(1.0),
          duration: 360.milliseconds,
          delay: fadeOff ? 1.milliseconds : this.delay.milliseconds,
          control: !fadeOff
              ? CustomAnimationControl.PLAY
              : CustomAnimationControl.PLAY_REVERSE,
          builder: (context, child, animation) {
            return Transform(
              transform: Matrix4.identity()
                ..translate(
                  0.0,
                  (Dimensions.revealOffset * 0.3) -
                      (animation * (Dimensions.revealOffset * 0.3)),
                ),
              child: Opacity(
                opacity: animation,
                child: child,
              ),
            );
          },
          child: this.child,
        );
      },
    );
  }
}
