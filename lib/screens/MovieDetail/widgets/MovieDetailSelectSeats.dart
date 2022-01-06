import 'package:flutter/material.dart';
import 'package:invmovieconcept1/UI.dart';
import 'package:supercharged/supercharged.dart';

import 'package:invmovieconcept1/models/MovieObject.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/CommonProps.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/App.dart';

import '../messages/keys.dart';
import '../TestKeys.dart';
import '../provider.dart';

import 'MDReveal.dart';

class MovieDetailSelectSeats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MovieObject movie = ModalRoute.of(context).settings.arguments;

    return Positioned(
      left: 0,
      right: 0,
      bottom: UI.padding.bottom,
      child: MDReveal(
        delay: 200,
        child: Container(
          decoration: BoxDecoration(
            gradient: CommonProps.bottomBgGradient,
          ),
          padding: EdgeInsets.only(
            top: AppDimensions.padding * 3,
            left: AppDimensions.padding * 3,
            right: AppDimensions.padding * 3,
            bottom: AppDimensions.padding * 2,
          ),
          child: RaisedButton(
            key: Key(MovieDetailTestKeys.selectSeats),
            onPressed: () async {
              MovieDetailProvider.state(context).setFade(true);
              await 360.milliseconds.delay;
              await Navigator.pushNamed(
                context,
                "selectSeats",
                arguments: {"movie": movie},
              );
              MovieDetailProvider.state(context).setFade(false);
            },
            color: AppTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Text(
              App.translate(MovieDetailScreenMessages.select, context),
              style: TextStyles.body17.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
