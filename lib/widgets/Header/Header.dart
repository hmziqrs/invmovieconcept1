import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/App.dart';

import 'package:invmovieconcept1/Utils.dart';

import 'package:invmovieconcept1/widgets/Buttons/BackIcon.dart';

import 'TestKeys.dart';

class Header extends StatelessWidget {
  Header({
    required this.label,
    required this.onBack,
    this.enableSafePadding = true,
  });

  final String label;
  final bool enableSafePadding;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: this.enableSafePadding
          ? Utils.safePaddingUnit(context, "top")
          : EdgeInsets.zero,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.background,
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
            Container(
              key: Key(HeaderWidgetKey.backButton),
              child: BackIconButton(onPressed: onBack),
            ),
            Container(
              padding: EdgeInsets.all(AppDimensions.padding * 2),
              child: Text(
                App.translate(this.label, context),
                style: TextStyles.heading46,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
