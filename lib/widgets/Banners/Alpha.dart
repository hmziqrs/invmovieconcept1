import 'package:flutter/material.dart';
import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';

class AlphaBanner extends StatelessWidget {
  AlphaBanner({
    @required this.text,
    this.margin = EdgeInsets.zero,
  });

  final String text;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.text.withOpacity(0.65),
      ),
      padding: EdgeInsets.only(
        left: AppDimensions.padding * 2.0,
        right: AppDimensions.padding * 2.0,
        top: AppDimensions.padding * 1.0,
        bottom: AppDimensions.padding * 1.5,
      ),
      child: Text(
        this.text,
        style: TextStyles.body17.copyWith(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
