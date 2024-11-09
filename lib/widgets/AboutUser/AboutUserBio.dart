import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/App.dart';

class AboutUserBio extends StatelessWidget {
  AboutUserBio({
    required this.points,
    this.translate = true,
  });

  final List<String> points;
  final bool translate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: this
          .points
          .map(
            (text) => Padding(
              padding: EdgeInsets.only(
                left: AppDimensions.padding * 2,
                right: AppDimensions.padding * 2,
                top: AppDimensions.padding * 0.8,
              ),
              child: Text(
                App.translate(text, context),
                style: TextStyles.body16.copyWith(
                  color: AppTheme.subText,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
