import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';

import '../provider.dart';

class SelectSeatsBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppTheme.background,
                AppTheme.background.withOpacity(0.01),
              ],
            ),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: InkResponse(
              onTap: () async {
                SelectSeatsProvider.state(context).setFade(true);
                await 360.milliseconds.delay;
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(AppDimensions.padding * 2).copyWith(
                  top: MediaQuery.of(context).padding.top +
                      AppDimensions.padding * 2,
                ),
                child: Icon(
                  Icons.chevron_left,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
