import 'package:flutter/material.dart';
import 'package:invmovieconcept1/configs/CommonProps.dart';
import 'package:invmovieconcept1/models/MovieObject.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/App.dart';

import '../messages/keys.dart';
import '../provider.dart';
import 'SSReveal.dart';

class SelectSeatsBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MovieObject movie = ModalRoute.of(context).settings.arguments;

    return Selector<SelectSeatsProvider, List<Tuple2<int, int>>>(
      selector: (_, state) => state.seats,
      builder: (context, seats, child) {
        return AnimatedPositioned(
          left: 0,
          right: 0,
          duration: 300.milliseconds,
          bottom: AppDimensions.padding * (seats.length > 0 ? 0 : -12),
          child: SSReveal(
            delay: 1,
            child: Container(
              decoration: BoxDecoration(
                gradient: CommonProps.bottomBgGradient,
              ),
              padding: EdgeInsets.all(AppDimensions.padding * 2),
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.background,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                // margin: EdgeInsets.symmetric(
                //   horizontal: AppDimensions.padding * 2,
                // ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.text.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "\$${seats.length * 40}",
                              style: TextStyles.heading4,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 5,
                        child: Hero(
                          tag: "btn",
                          child: Material(
                            color: Colors.transparent,
                            child: GestureDetector(
                              onTap: () {
                                if (seats.isEmpty) {
                                  return;
                                }
                                // final state = SelectSeatsProvider.state(context);
                                Navigator.pushNamed(
                                  context,
                                  "reservation",
                                  arguments: movie,
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: AppDimensions.padding * 2,
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.primary,
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    App.translate(
                                      SelectSeatsScreenMessages.buyNow,
                                    ),
                                    style: TextStyles.heading56.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
