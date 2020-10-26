import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/App.dart';

import 'package:invmovieconcept1/providers/Reservation.dart';

import 'package:invmovieconcept1/widgets/Header/Header.dart';

import '../messages/keys.dart';
import 'MyMovieCard.dart';

class MyMoviesBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = ReservationProvider.state(context, true);

    final List<Widget> children = [
      Header(
        enableSafePadding: false,
        label: App.translate(MyMoviesScreenMessages.myMovies, context),
      ),
    ];

    if (state.list.isNotEmpty) {
      children.addAll(
        state.list.map(
          (reservation) {
            return MyMovieCard(reservation: reservation);
          },
        ).toList(),
      );
      children.add(
        Padding(
          padding: EdgeInsets.all(AppDimensions.padding * 3),
          child: RaisedButton(
            onPressed: () => state.clear(),
            color: AppTheme.primary,
            textColor: Colors.white,
            child: Text(
              App.translate(
                MyMoviesScreenMessages.clear,
                context,
              ),
            ),
          ),
        ),
      );
    }
    if (state.loading) {
      children.add(
        Padding(
          padding: EdgeInsets.only(top: AppDimensions.padding * 20),
          child: LinearProgressIndicator(),
        ),
      );
    } else if (state.list.isEmpty) {
      children.add(
        Padding(
          padding: EdgeInsets.only(top: AppDimensions.padding * 6),
          child: Center(
            child: Text(
              App.translate(MyMoviesScreenMessages.notFound, context),
              style: TextStyles.heading6,
            ),
          ),
        ),
      );
    }

    return ListView(
      children: children,
    );
  }
}
