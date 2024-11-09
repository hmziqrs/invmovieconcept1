import 'package:flutter/material.dart';
import 'package:invmovieconcept1/models/MovieTicket.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';

import 'package:invmovieconcept1/models/MovieObject.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';

import 'package:invmovieconcept1/widgets/Header/StackFade.dart';
import 'package:invmovieconcept1/widgets/Screen/Screen.dart';

import 'widgets/SelectSeatsBody.dart';
import 'widgets/BuyNow.dart';

import 'Dimensions.dart';
import 'provider.dart';

class SelectSeatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;

    MovieTicket? reservation = arguments["reservation"];
    MovieObject movie = arguments["movie"];

    final isReserved = reservation != null;

    return ChangeNotifierProvider<SelectSeatsProvider>(
      create: (_) => SelectSeatsProvider(reservation),
      child: Screen(
        overBuilders: [],
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: AppDimensions.maxContainerWidth,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: SelectSeatsBody(
                    movie: movie,
                    isReserved: isReserved,
                  ),
                ),
                StackFadeHeader(
                  onTap: (context) async {
                    SelectSeatsProvider.state(context).setFade(true);
                    await 360.milliseconds.delay;
                    Navigator.pop(context);
                  },
                ),
                SelectSeatsBuyNow(
                  movie: movie,
                  isReserved: isReserved,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
