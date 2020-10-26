import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';

import 'package:invmovieconcept1/widgets/Screen/Screen.dart';

import 'widgets/MyMoviesBody.dart';

import 'Dimensions.dart';

class MyMoviesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return Screen(
      child: Align(
        child: Container(
          width: AppDimensions.containerWidth,
          child: MyMoviesBody(),
        ),
      ),
    );
  }
}
