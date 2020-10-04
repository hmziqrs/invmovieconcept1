import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';

import 'package:invmovieconcept1/Utils.dart';

import 'package:invmovieconcept1/widgets/Buttons/BackIcon.dart';

class AboutDeveloperHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.safePaddingUnit(context, "top"),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: AppTheme.lightShadow,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            BackIconButton(onPressed: () {}),
            Container(
              // color: Colors.red,
              padding: EdgeInsets.all(AppDimensions.padding * 2),
              child: Text(
                "About Developer",
                style: TextStyles.heading46,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
