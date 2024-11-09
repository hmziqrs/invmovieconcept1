import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

import 'package:invmovieconcept1/widgets/Screen/Screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({required this.loading});
  final bool loading;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool play = false;
  bool remove = false;

  @override
  void didUpdateWidget(covariant SplashScreen oldWidget) {
    if (oldWidget.loading && !this.widget.loading) {
      this.playAnimation();
    }
    super.didUpdateWidget(oldWidget);
  }

  void playAnimation() async {
    await 200.milliseconds.delay;
    this.setState(() {
      this.play = true;
    });
  }

  Future<void> onEnd() async {
    this.setState(() {
      this.remove = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageSize = 300.0;

    if (remove) {
      return Container();
    }

    final mediaQuery = MediaQueryData.fromView(ui.window);
    final check = (this.widget.loading && !this.play);

    return MediaQuery(
      data: mediaQuery,
      child: Screen(
        renderSettings: false,
        scaffoldBackgroundColor: Colors.transparent,
        child: Align(
          child: AnimatedOpacity(
            duration: 400.milliseconds,
            opacity: this.play ? 0.0 : 1.0,
            onEnd: this.onEnd,
            child: Container(
              width: mediaQuery.size.width,
              height: mediaQuery.size.height,
              color: Colors.white.withOpacity(1.0),
              alignment: Alignment.center,
              child: LoopAnimationBuilder<double>(
                curve: Curves.easeIn,
                tween: 0.2.tweenTo(1.0),
                duration: 300.milliseconds,
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
      ),
    );
  }
}
