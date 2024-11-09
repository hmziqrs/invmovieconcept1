import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:invmovieconcept1/configs/Theme.dart' as theme;
import 'package:invmovieconcept1/configs/AppDimensions.dart';

import 'package:invmovieconcept1/widgets/Screen/Screen.dart';

import 'widgets/DownloadBody.dart';
import 'Dimensions.dart';

class DownloadScreen extends StatelessWidget {
  Widget belowBuilder(context) {
    return LoopAnimationBuilder<Color>(
      tween: Tween<Color>(
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
      child: Align(
        child: Container(
          width: AppDimensions.maxContainerWidth,
          child: DownloadBody(),
        ),
      ),
    );
  }
}
