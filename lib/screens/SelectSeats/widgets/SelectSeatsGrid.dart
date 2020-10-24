import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';

import '../Dimensions.dart';
import '../provider.dart';
import 'SSReveal.dart';

class SelectSeatsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reserved = SelectSeatsProvider.state(context).reserved;
    return SSReveal(
      delay: 600,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppDimensions.padding * 2,
        ),
        child: Selector<SelectSeatsProvider, List<Tuple2<int, int>>>(
          selector: (_, state) => state.seats,
          builder: (context, seats, child) {
            return Column(
              children: List.generate(
                6,
                (yIndex) {
                  final limit = yIndex == 0 ? 5 : 9;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      limit,
                      (xIndex) {
                        final centerIndex = (limit / 2).floor();
                        if (yIndex > 0 && centerIndex == xIndex) {
                          return Flexible(
                            child: SizedBox(
                              width: double.infinity,
                            ),
                          );
                        }
                        final seat = Tuple2<int, int>(yIndex, xIndex);
                        final isActive = seats.contains(seat);
                        final isReserved = reserved.contains(seat);

                        Color seatColor = isActive
                            ? AppTheme.accent
                            : AppTheme.text.withOpacity(0.25);

                        if (isReserved) {
                          seatColor = AppTheme.accent1;
                        }

                        return GestureDetector(
                          onTap: () {
                            if (isReserved) {
                              return;
                            }
                            SelectSeatsProvider.state(context).toggleSeat(
                              seat,
                            );
                          },
                          child: AnimatedContainer(
                            duration: 300.milliseconds,
                            width: Dimensions.seatBox,
                            height: Dimensions.seatBox * 0.81,
                            margin: EdgeInsets.symmetric(
                              vertical: AppDimensions.padding * 1.2,
                              horizontal: AppDimensions.padding * 0.6,
                            ),
                            decoration: BoxDecoration(
                              color: seatColor,
                              // color: AppTheme.text.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  );
                },
              ).toList(),
            );
          },
        ),
      ),
    );
  }
}
