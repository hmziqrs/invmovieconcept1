import 'package:flutter/material.dart';
import 'package:invmovieconcept1/configs/App.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';

import 'package:invmovieconcept1/providers/Reservation.dart';

import 'package:invmovieconcept1/widgets/Header/Header.dart';

import '../messages/keys.dart';
import 'MyMovieCard.dart';

class MyMoviesBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = ReservationProvider.state(context);

    final List<Widget> children = [
      Header(
        label: App.translate(MyMoviesScreenMessages.myMovies, context),
      ),
    ];

    if (state.list != null && state.list.isNotEmpty) {
      children.addAll(
        state.list.map(
          (reservation) {
            return MyMovieCard(reservation: reservation);
          },
        ).toList(),
      );
    } else if (state.loading) {
      children.add(
        Padding(
          padding: EdgeInsets.only(top: AppDimensions.padding * 20),
          child: LinearProgressIndicator(),
        ),
      );
    }

    return ListView(
      children: children,
    );
  }
}
