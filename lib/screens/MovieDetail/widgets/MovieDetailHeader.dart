import 'package:flutter/material.dart';
import 'package:invmovieconcept1/screens/MovieDetail/provider.dart';
import 'package:supercharged/supercharged.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/App.dart';

class MovieDetailHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: App.isLtr ? 0 : null,
      right: !App.isLtr ? 0 : null,
      child: InkResponse(
        onTap: () async {
          MovieDetailProvider.state(context).setFade(true);
          await 360.milliseconds.delay;
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.all(AppDimensions.padding * 2),
          child: Icon(
            Icons.chevron_left,
          ),
        ),
      ),
    );
  }
}
