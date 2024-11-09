import 'package:flutter/material.dart';
import 'package:invmovieconcept1/UI.dart';
import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import 'package:invmovieconcept1/widgets/Screen/Screen.dart';

class SplashScreen extends StatelessWidget {
  Widget build(BuildContext context) {  
    AppDimensions.init(context);
    final imageSize = 300.0;

    return Screen(
      renderSettings: false,
      scaffoldBackgroundColor: Colors.transparent,
      child: Align(
        child: AnimatedOpacity(
          duration: 400.milliseconds,
          opacity: 1.0,
          child: Container(
            width: UI.width,
            height: UI.height,
            color: Colors.white.withOpacity(1.0),
            alignment: Alignment.center,
            child: MirrorAnimationBuilder<double>(
              curve: Curves.easeIn,
              tween: 0.2.tweenTo(1.0),
              duration: 900.milliseconds,
              child: Image.asset(
                "assets/icons/app-icon.png",
                width: imageSize,
                height: imageSize,
              ),
              builder: (context, animation, child) {
                return Transform.scale(
                  scale: 1 + animation * 0.4,
                  child: child,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
