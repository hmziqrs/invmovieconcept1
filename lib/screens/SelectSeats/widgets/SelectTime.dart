import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';

import '../Dimensions.dart';
import '../TestKeys.dart';
import '../provider.dart';
import 'SSReveal.dart';

class SelectSeatsTime extends StatelessWidget {
  SelectSeatsTime({
    this.isReserved = false,
  });
  final bool isReserved;

  @override
  Widget build(BuildContext context) {
    return SSReveal(
      delay: 300,
      child: SizedBox(
        height: Dimensions.timeSelectBox,
        child: Selector<SelectSeatsProvider, DateTime?>(
          selector: (_, state) => state.selectedTime,
          builder: (context, selectedTime, child) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 1.5,
              ),
              itemCount: SelectSeatsProvider.times.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (c, index) {
                final time = SelectSeatsProvider.times[index];
                final isSelected = selectedTime == time;
                final textColor = isSelected ? Colors.white : Colors.black;

                return GestureDetector(
                  key: Key(SelectSeatsTestKeys.getTime(index)),
                  onTap: () {
                    if (this.isReserved) {
                      return;
                    }
                    SelectSeatsProvider.state(context).selectTime(
                      time,
                    );
                  },
                  child: AnimatedContainer(
                    duration: 300.milliseconds,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: isSelected
                          ? AppTheme.accent
                          : AppTheme.text.withOpacity(
                              AppTheme.isDark(context) ? 0.4 : 0.1,
                            ),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: AppDimensions.padding * 1.5,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.padding * 3,
                    ),
                    child: Center(
                      child: AnimatedDefaultTextStyle(
                        duration: 300.milliseconds,
                        style: DefaultTextStyle.of(context).style.copyWith(
                              color: textColor,
                            ),
                        child: Text(
                          DateFormat('hh:mm a').format(time),
                          style: TextStyles.heading5,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
