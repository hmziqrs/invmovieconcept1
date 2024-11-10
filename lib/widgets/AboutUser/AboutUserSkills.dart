import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';

class AboutUserSkills extends StatelessWidget {
  AboutUserSkills({
    required this.skills,
  });

  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.padding * 1,
      ),
      child: Wrap(
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: this
            .skills
            .map(
              (text) => Container(
                decoration: BoxDecoration(
                  color: AppTheme.background,
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(
                    width: 1.6,
                    color: AppTheme.primary,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.0, 1.0),
                      blurRadius: 3,
                      color: AppTheme.primary.withOpacity(0.30),
                    ),
                  ],
                ),
                margin: EdgeInsets.all(
                  AppDimensions.padding * 1,
                ),
                padding: EdgeInsets.symmetric(
                  vertical: AppDimensions.padding * 1.2,
                  horizontal: AppDimensions.padding * 2,
                ),
                child: Text(
                  text.toUpperCase(),
                  style: TextStyles.body27,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
