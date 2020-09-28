import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';

class ScreenSettingsSelect extends StatelessWidget {
  ScreenSettingsSelect({
    @required this.onPress,
    @required this.isActive,
    this.text,
    this.textChild,
  });

  final VoidCallback onPress;
  final bool isActive;
  final String text;
  final Widget textChild;

  Color getIsActive(BuildContext context) {
    if (!this.isActive) {
      return Colors.transparent;
    }
    return Theme.of(context).textTheme.bodyText1.color.withOpacity(0.08);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: AppDimensions.padding,
      ),
      width: double.infinity,
      child: InkWell(
        onTap: this.onPress,
        child: Container(
          color: this.getIsActive(context),
          padding: EdgeInsets.symmetric(
            vertical: AppDimensions.padding * 2,
            horizontal: AppDimensions.padding * 2.4,
          ),
          child: this.textChild ??
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
        ),
      ),
    );
  }
}
