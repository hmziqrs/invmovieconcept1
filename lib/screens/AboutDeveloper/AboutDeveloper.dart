import 'package:flutter/material.dart';

import 'package:invmovieconcept1/widgets/ScreenReveals/AvatarWithPunchHole.dart';
import 'package:invmovieconcept1/widgets/Screen/Screen.dart';

import 'widgets/AboutDeveloperBody.dart';

import 'Dimensions.dart';

class AboutDeveloperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return Screen(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: AboutDeveloperBody(),
          ),
          Positioned.fill(
            child: ScreenRevealAvatarWithPunchHole(
              avatar: "assets/avatars/goku.png",
              avatarRadius: Dimensions.avatarRadius,
            ),
          ),
        ],
      ),
    );
  }
}
