import 'package:flutter/material.dart';
import 'package:invmovieconcept1/configs/CommonProps.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/App.dart';

import '../messages/keys.dart';
import '../provider.dart';

class ReservationBookNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: 0,
      right: 0,
      duration: 300.milliseconds,
      bottom: AppDimensions.padding * (1 > 0 ? 0 : -12),
      child: Container(
        decoration: BoxDecoration(
          gradient: CommonProps.bottomBgGradient,
        ),
        padding: EdgeInsets.all(AppDimensions.padding * 2),
        child: Hero(
          tag: "btn",
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.primary,
              borderRadius: BorderRadius.circular(40.0),
            ),
            padding: EdgeInsets.symmetric(
              vertical: AppDimensions.padding * 2,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    App.translate(ReservationScreenMessages.bookNow),
                    style: TextStyles.heading56.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
