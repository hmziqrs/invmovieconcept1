import 'package:flutter/material.dart';
import 'package:invmovieconcept1/configs/App.dart';

import 'package:invmovieconcept1/widgets/Screen/Screen.dart';
import 'package:simple_animations/simple_animations.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({@required this.loading});
  final bool loading;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AnimationMixin {
  Animation<double> animation;
  bool remove = false;

  @override
  void initState() {
    this.animation = Tween(begin: 0.0, end: 1.0).animate(this.controller);
    this.animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          this.remove = true;
        });
      }
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SplashScreen oldWidget) {
    if (oldWidget.loading && !this.widget.loading) {
      this.controller.play(duration: Duration(milliseconds: 600));
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final imageSize = 300.0;

    if (remove) {
      return Container();
    }
    return Opacity(
      opacity: 1.0 - this.animation.value,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Screen(
          init: App.init,
          child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: CustomAnimation<double>(
              control: this.widget.loading
                  ? CustomAnimationControl.MIRROR
                  : CustomAnimationControl.STOP,
              tween: Tween(begin: 0.8, end: 1.2),
              duration: Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              builder: (context, _, scale) {
                return Transform.scale(
                  scale: scale + (this.animation.value * 3),
                  child: Image.asset(
                    "assets/icons/app-icon.png",
                    width: imageSize,
                    height: imageSize,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
