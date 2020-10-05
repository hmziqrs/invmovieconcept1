import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/App.dart';

class AboutDeveloperHeading extends StatelessWidget {
  AboutDeveloperHeading({
    @required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.padding * 2,
      ),
      child: Text(
        App.translate(this.label, context),
        style: TextStyles.heading4,
      ),
    );
  }
}
