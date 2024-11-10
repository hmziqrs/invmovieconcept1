import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';

import '../../Dimensions.dart';
import '../../TestKeys.dart';
import '../../Theme.dart';

class HomeDrawerAvatar extends StatelessWidget {
  HomeDrawerAvatar({
    required this.baseAnimation,
  });

  final double baseAnimation;

  @override
  Widget build(BuildContext context) {
    return CustomAnimationBuilder<double>(
      control: baseAnimation > 0.8
          ? Control.play : Control.playReverse,
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 320),
      builder: (context, opacity, _) {
        return Opacity(
          opacity: opacity,
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: AppDimensions.padding * 2,
              horizontal: AppDimensions.padding * 2,
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 3,
                      color: HomeTheme.text,
                    ),
                  ),
                  child: CircleAvatar(
                    child: ClipOval(
                      child: Image.asset(
                        "assets/avatars/goku.png",
                      ),
                    ),
                    radius: Dimensions.drawerAvatarWidth,
                  ),
                ),
                Container(
                  width: AppDimensions.padding * 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hamza Iqbal",
                      style: TextStyle(
                        color: HomeTheme.text,
                        fontWeight: FontWeight.w700,
                        fontSize: AppDimensions.ratio * 6 + 8,
                      ),
                    ),
                    Text(
                      "hamza.iqdev@gmail.com",
                      style: TextStyle(
                        color: HomeTheme.text,
                        fontWeight: FontWeight.w600,
                        fontSize: AppDimensions.ratio * 5 + 5,
                      ),
                    ),
                  ],
                ),
                Flexible(child: Container()),
                IconButton(
                  iconSize: AppDimensions.ratio * 10,
                  key: Key(HomeTestKeys.drawerCloseButton),
                  icon: Icon(
                    Icons.close,
                    color: HomeTheme.text,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
