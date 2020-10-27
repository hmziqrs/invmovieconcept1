import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/models/MovieObject.dart';
import 'package:invmovieconcept1/models/MovieTicket.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/CommonProps.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/App.dart';

import '../TestKeys.dart';
import '../messages/keys.dart';
import '../provider.dart';
import 'SSReveal.dart';

class SelectSeatsBuyNow extends StatelessWidget {
  SelectSeatsBuyNow({
    @required this.movie,
    this.isReserved = false,
  });
  final MovieObject movie;
  final bool isReserved;

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectSeatsProvider>(
      builder: (context, state, child) {
        return AnimatedPositioned(
          left: 0,
          right: 0,
          duration: 300.milliseconds,
          bottom: AppDimensions.padding *
              (state.selectedSeats.length > 0 &&
                      state.selectedSeats != null &&
                      state.selectedDay != null &&
                      state.selectedTime != null &&
                      !this.isReserved
                  ? 0
                  : -12),
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
                              "\$${state.selectedSeats.length * 40}",
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
                              key: Key(SelectSeatsTestKeys.buyNow),
                              onTap: () {
                                if (state.selectedSeats.isEmpty) {
                                  return;
                                }

                                final time = state.selectedDay.add(
                                  Duration(
                                    hours: state.selectedTime.hour,
                                  ),
                                );
                                print(time);
                                final ticket = MovieTicket(
                                  time: time,
                                  movie: this.movie,
                                  seats: state.selectedSeats,
                                );
                                Navigator.pushNamed(
                                  context,
                                  "reservation",
                                  arguments: ticket,
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
                                      context,
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
