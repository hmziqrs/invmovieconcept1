import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';

import '../data.dart' as data;

class AboutDeveloperMySkills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.padding * 1,
      ),
      child: Wrap(
        children: data.skills
            .map(
              (text) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border.all(
                    width: 1.6,
                    color: Theme.of(context).primaryColor,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.0, 1.0),
                      blurRadius: 3,
                      color: Theme.of(context).primaryColor.withOpacity(0.30),
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
