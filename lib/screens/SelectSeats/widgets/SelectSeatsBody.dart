import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:invmovieconcept1/io/io.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/models/MovieObject.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';

import 'SelectSeatsHeader.dart';
import 'SelectSeatsGrid.dart';
import 'SelectTime.dart';
import 'ScreenArt.dart';
import 'SelectDay.dart';

import '../provider.dart';

class SelectSeatsBody extends StatelessWidget {
  SelectSeatsBody({
    required this.movie,
    this.isReserved = false,
  });

  final bool isReserved;
  final MovieObject movie;

  @override
  Widget build(BuildContext context) {
    final state = SelectSeatsProvider.state(context);

    return ConditionalWillPopScope(
      shouldAddCallback: Platform.isAndroid,
      onWillPop: () async {
        SelectSeatsProvider.state(context).setFade(true);
        await 360.milliseconds.delay;
        return true;
      },
      child: ListView(
        controller: state.controller,
        children: [
          SizedBox(height: AppDimensions.padding * 9),
          SelectSeatsHeader(movie: movie),
          SizedBox(height: AppDimensions.padding * 3),
          SelectSeatsDay(isReserved: isReserved),
          SizedBox(height: AppDimensions.padding * 5),
          SelectSeatsTime(isReserved: isReserved),
          SizedBox(height: AppDimensions.padding * 5),
          ScreenArt(),
          SizedBox(height: AppDimensions.padding * 7),
          SelectSeatsGrid(isReserved: isReserved),
          Consumer<SelectSeatsProvider>(
            builder: (context, state, child) {
              final isVerified = state.selectedSeats.length > 0 &&
                  state.selectedSeats != null &&
                  state.selectedTime != null &&
                  state.selectedDay != null &&
                  !this.isReserved;

              return AnimatedContainer(
                duration: 200.milliseconds,
                height: AppDimensions.padding * (isVerified ? 12 : 2),
              );
            },
          ),
        ],
      ),
    );
  }
}
