import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/App.dart';

import '../messages/keys.dart';
import '../provider.dart';

class SelectSeatsBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<SelectSeatsProvider, List<Tuple2<int, int>>>(
      selector: (_, state) => state.seats,
      builder: (context, seats, child) {
        return AnimatedPositioned(
          left: 0,
          right: 0,
          duration: 300.milliseconds,
          bottom: AppDimensions.padding * (seats.length > 0 ? 2 : -12),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.circular(40.0),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: AppDimensions.padding * 2,
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
                          "\$${seats.length * 40}",
                          style: TextStyles.heading4,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: AppDimensions.padding * 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.accent,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            App.translate(SelectSeatsScreenMessages.buyNow),
                            style: TextStyles.heading56.copyWith(
                              color: Colors.white,
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
        );
      },
    );
  }
}
