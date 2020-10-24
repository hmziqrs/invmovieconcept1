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

class SelectSeatsDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTime = DateTime.now();

    return SSReveal(
      delay: 150,
      child: SizedBox(
        height: Dimensions.daySelectBox,
        child: Selector<SelectSeatsProvider, int>(
          selector: (_, state) => state.selectedDay,
          builder: (context, selectedDay, child) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 1.5,
              ),
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final time = currentTime.add(Duration(days: index));
                final isSelected = selectedDay != null && selectedDay == index;
                final textColor = isSelected ? Colors.white : Colors.black;
                return GestureDetector(
                  onTap: () => SelectSeatsProvider.state(
                    context,
                  ).selectDay(
                    index,
                  ),
                  child: AnimatedContainer(
                    duration: 300.milliseconds,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: isSelected ? AppTheme.accent : AppTheme.accent1,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: AppDimensions.padding * 1.5,
                    ),
                    padding: EdgeInsets.symmetric(
                      // vertical: AppDimensions.padding * 1.5,
                      horizontal: AppDimensions.padding * 3,
                    ),
                    child: AnimatedDefaultTextStyle(
                      duration: 300.milliseconds,
                      style: DefaultTextStyle.of(context).style.copyWith(
                            color: textColor,
                          ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            time.day.toString(),
                            style: TextStyles.heading5,
                          ),
                          Text(
                            DateFormat('EEE').format(time),
                            style: TextStyles.body26,
                          ),
                        ],
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
