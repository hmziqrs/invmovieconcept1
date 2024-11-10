import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:invmovieconcept1/configs/App.dart';
import 'package:invmovieconcept1/screens/Download/messages/keys.dart';
import 'package:invmovieconcept1/widgets/Header/Header.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:invmovieconcept1/configs/Theme.dart' as theme;
import 'package:invmovieconcept1/configs/AppDimensions.dart';

import 'package:invmovieconcept1/widgets/Screen/Screen.dart';

import 'widgets/DownloadBody.dart';
import 'Dimensions.dart';

class DownloadScreen extends StatelessWidget {
  Widget belowBuilder(context) {
    return MirrorAnimationBuilder<Color?>(
      tween: ColorTween(
        begin: theme.primary.withOpacity(0.15),
        end: theme.primary.withOpacity(1.0),
      ),
      duration: Duration(milliseconds: 2400),

      builder: (context, animation, child) {
        return Positioned(
          bottom: AppDimensions.ratio * -10,
          right: AppDimensions.ratio * 5,
          child: Icon(
            IonIcons.download,
            size: AppDimensions.ratio * 100,
            color: animation,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return Screen(
      belowBuilder: this.belowBuilder,
      child: Column(
        children: [
          Header(
            label: App.translate(DownloadScreenMessages.title),
            onBack: () => Navigator.popUntil(
              context,
              ModalRoute.withName("home"),
            ),
          ),
          Expanded(
            child: Container(
              width: AppDimensions.maxContainerWidth,
              child: DownloadBody(),
            ),
          ),
        ],
      ),
    );
  }
}
