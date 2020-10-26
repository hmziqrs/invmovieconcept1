import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';

import '../Dimensions.dart';
import '../provider.dart';
import 'SSReveal.dart';

class SelectSeatsGrid extends StatelessWidget {
  SelectSeatsGrid({
    this.isReserved = false,
  });
  final bool isReserved;

  @override
  Widget build(BuildContext context) {
    return SSReveal(
      delay: 600,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: AppDimensions.padding * 2,
        ),
        child: Selector<SelectSeatsProvider, List<Tuple2<int, int>>>(
          selector: (context, state) => state.selectedSeats,
          builder: (context, selectedSeats, child) {
            return Column(
              children: SelectSeatsProvider.seats.asMap().entries.map(
                (yEntry) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: yEntry.value.asMap().entries.map(
                      (xEntry) {
                        final centerIndex = (yEntry.value.length / 2).floor();
                        if (yEntry.key > 0 && centerIndex == xEntry.key) {
                          return Flexible(
                            child: SizedBox(
                              width: double.infinity,
                            ),
                          );
                        }
                        final isActive = selectedSeats.contains(xEntry.value);
                        final isReserved =
                            SelectSeatsProvider.reserved.contains(xEntry.value);

                        Color seatColor = isActive
                            ? AppTheme.accent
                            : AppTheme.text.withOpacity(0.25);

                        if (isReserved) {
                          seatColor = AppTheme.accent1;
                        }

                        return GestureDetector(
                          onTap: () {
                            if (isReserved || this.isReserved) {
                              return;
                            }
                            SelectSeatsProvider.state(context).toggleSeat(
                              xEntry.value,
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
