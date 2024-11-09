import 'package:flutter/material.dart';
import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import 'package:invmovieconcept1/widgets/Header/StackFade.dart';

import '../provider.dart';

class MovieDetailHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Selector<MovieDetailProvider, bool>(
        selector: (ctx, state) => state.fadeOff,
        builder: (context, fadeOff, child) {
          return CustomAnimationBuilder<double>(
            tween: 0.0.tweenTo(1.0),
            duration: 360.milliseconds,
            delay: 700.milliseconds,
            control: !fadeOff
                ? Control.play : Control.playReverse,
            builder: (context, animation, child) {
              return Transform(
                transform: Matrix4.identity()
                  ..translate(
                    0.0,
                    AppDimensions.padding * 10 * (animation - 1),
                  ),
                child: Opacity(
                  opacity: animation,
                  child: child,
                ),
              );
            },
            child: StackFadeHeader(
              disableStack: true,
              onTap: (context) async {
                MovieDetailProvider.state(context).setFade(true);
                await 360.milliseconds.delay;
                Navigator.pop(context);
              },
            ),
          );
        },
      ),
    );
  }
}
