import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';

import 'MDReveal.dart';

class MovieDetailSelectSeats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: MDReveal(
        delay: 200,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppTheme.background.withOpacity(0.001),
                AppTheme.background,
              ],
            ),
          ),
          padding: EdgeInsets.only(
            top: AppDimensions.padding * 3,
            left: AppDimensions.padding * 3,
            right: AppDimensions.padding * 3,
            bottom: AppDimensions.padding * 3,
          ),
          child: RaisedButton(
            onPressed: () {},
            color: AppTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Text(
              "Select Seats",
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
