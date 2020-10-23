import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/App.dart';

import '../messages/keys.dart';
import 'MDReveal.dart';

class MovieDetailDesc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MDReveal(
      delay: 900,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.padding * 3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              App.translate(MovieDetailScreenMessages.description, context),
              style: TextStyles.heading3,
            ),
            SizedBox(height: AppDimensions.padding * 1),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry",
              style: TextStyles.body1.copyWith(
                color: AppTheme.subText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
