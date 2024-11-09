import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/App.dart';

import 'package:invmovieconcept1/widgets/Header/StackFade.dart';
import 'package:invmovieconcept1/widgets/Screen/Screen.dart';

import 'widgets/ReservationBookNow.dart';
import 'widgets/ReservationBody.dart';

import 'messages/keys.dart';
import 'Dimensions.dart';

class ReservationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return Screen(
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: AppDimensions.maxContainerWidth,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: ReservationBody(),
              ),
              StackFadeHeader(
                onTap: (_) {
                  Navigator.pop(context);
                },
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    App.translate(ReservationScreenMessages.yourTicket),
                    textAlign: TextAlign.center,
                    style: TextStyles.heading5.copyWith(
                      color: AppTheme.text,
                    ),
                  ),
                  SizedBox(width: AppDimensions.padding * 8),
                ],
              ),
              ReservationBookNow(),
            ],
          ),
        ),
      ),
    );
  }
}
