import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';

class AboutUserJobTitle extends StatelessWidget {
  AboutUserJobTitle({
    @required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.padding * 2,
      ),
      child: Text(
        this.label,
        style: TextStyles.body17.copyWith(
          color: AppTheme.primary,
        ),
      ),
    );
  }
}
