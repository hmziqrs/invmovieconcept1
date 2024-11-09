import 'package:flutter/material.dart';
import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';

void showSnackBarBase({
  required BuildContext context,
  Widget child,
  String text,
}) {
  final snackbar = SnackBar(
    elevation: 0.0,
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        width: AppDimensions.maxContainerWidth,
        margin: EdgeInsets.symmetric(
          horizontal: AppDimensions.padding * 2,
        ),
        padding: EdgeInsets.symmetric(
          vertical: AppDimensions.padding * 2,
          horizontal: AppDimensions.padding * 2,
        ),
        decoration: BoxDecoration(
          color: AppTheme.background,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: AppTheme.shadow,
              offset: Offset(0.0, 4.0),
            ),
          ],
        ),
        child: child ??
            Text(
              text,
              style: TextStyles.body26.copyWith(
                color: AppTheme.text,
              ),
            ),
      ),
    ),
  );

  Scaffold.of(context).showSnackBar(snackbar);
}
