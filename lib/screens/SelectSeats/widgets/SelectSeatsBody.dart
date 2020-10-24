import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

import 'package:invmovieconcept1/models/MovieObject.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:tuple/tuple.dart';

import 'SelectSeatsHeader.dart';
import 'SelectSeatsGrid.dart';
import 'SelectTime.dart';
import 'ScreenArt.dart';
import 'SelectDay.dart';

import '../provider.dart';

class SelectSeatsBody extends StatelessWidget {
  SelectSeatsBody({
    @required this.movie,
  });
  final MovieObject movie;

  @override
  Widget build(BuildContext context) {
    final state = SelectSeatsProvider.state(context);

    return WillPopScope(
      onWillPop: () async {
        SelectSeatsProvider.state(context).setFade(true);
        await 360.milliseconds.delay;
        return true;
      },
      child: ListView(
        controller: state.controller,
        children: [
          SizedBox(height: AppDimensions.padding * 9),
          SelectSeatsHeader(),
          SizedBox(height: AppDimensions.padding * 3),
          SelectSeatsDay(),
          SizedBox(height: AppDimensions.padding * 5),
          SelectSeatsTime(),
          SizedBox(height: AppDimensions.padding * 5),
          ScreenArt(),
          SizedBox(height: AppDimensions.padding * 7),
          SelectSeatsGrid(),
          Selector<SelectSeatsProvider, List<Tuple2<int, int>>>(
            selector: (_, state) => state.seats,
            builder: (context, seats, child) {
              return AnimatedContainer(
                duration: 200.milliseconds,
                height: AppDimensions.padding * (seats.length > 0 ? 12 : 2),
              );
            },
          ),
        ],
      ),
    );
  }
}
