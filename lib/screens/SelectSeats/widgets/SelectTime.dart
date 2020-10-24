import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';

import '../Dimensions.dart';
import '../provider.dart';
import 'SSReveal.dart';

class SelectSeatsTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final current = DateTime.now();

    final currentDay = DateTime(
      current.year,
      current.month,
      current.day,
      9,
    );

    return SSReveal(
      delay: 300,
      child: SizedBox(
        height: Dimensions.timeSelectBox,
        child: Selector<SelectSeatsProvider, int>(
          selector: (_, state) => state.selectedTime,
          builder: (context, selectedTime, child) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 1.5,
              ),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final time = currentDay.add(Duration(hours: 3 * index));
                final isSelected =
                    selectedTime != null && selectedTime == index;
                final textColor = isSelected ? Colors.white : Colors.black;
                return GestureDetector(
                  onTap: () => SelectSeatsProvider.state(
                    context,
                  ).selectTime(
                    index,
                  ),
                  child: AnimatedContainer(
                    duration: 300.milliseconds,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: isSelected
                          ? AppTheme.accent
                          : AppTheme.text.withOpacity(
                              AppTheme.isDark(context) ? 0.4 : 0.1),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: AppDimensions.padding * 1.5,
                    ),
                    padding: EdgeInsets.symmetric(
                      // vertical: AppDimensions.padding * 1.5,
                      horizontal: AppDimensions.padding * 3,
                    ),
                    child: Center(
                      child: AnimatedDefaultTextStyle(
                        duration: 300.milliseconds,
                        style: DefaultTextStyle.of(context).style.copyWith(
                              color: textColor,
                            ),
                        child: Text(
                          DateFormat('hh:M a').format(time),
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
