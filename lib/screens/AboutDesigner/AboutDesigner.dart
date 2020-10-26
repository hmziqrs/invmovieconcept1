import 'package:flutter/material.dart';

import 'package:invmovieconcept1/widgets/ScreenReveals/AvatarWithPunchHole.dart';
import 'package:invmovieconcept1/widgets/Screen/Screen.dart';

import 'widgets/AboutDesignerBody.dart';

import 'Dimensions.dart';

class AboutDesignerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return Screen(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: AboutDesignerBody(),
          ),
          Positioned.fill(
            child: ScreenRevealAvatarWithPunchHole(
              avatar: "assets/avatars/rick.jpg",
              avatarRadius: Dimensions.avatarRadius,
            ),
          ),
        ],
      ),
    );
  }
}
