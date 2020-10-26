import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:invmovieconcept1/models/MovieTicket.dart';
import 'package:invmovieconcept1/providers/Reservation.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:supercharged/supercharged.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/CommonProps.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/App.dart';

import '../messages/keys.dart';
import '../Dimensions.dart';

class ReservationBookNow extends StatelessWidget {
  onTap(BuildContext context) async {
    final MovieTicket ticket = ModalRoute.of(context).settings.arguments;

    ReservationProvider.state(context).add(ticket);

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Align(
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Container(
                width: Dimensions.modalWidth,
                decoration: BoxDecoration(
                  color: AppTheme.background,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(AppDimensions.padding * 2),
                      child: Text(
                        App.translate(
                          ReservationScreenMessages.thankYou,
                          context,
                        ),
                        style: TextStyles.heading56,
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppTheme.text.withOpacity(0.1),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.padding * 2,
                        vertical: AppDimensions.padding * 3,
                      ),
                      child: Text(
                        App.translate(
                          ReservationScreenMessages.modalDesc,
                          context,
                        ),
                        style: TextStyles.body2.copyWith(
                          color: AppTheme.subText2,
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppTheme.text.withOpacity(0.1),
                    ),
                    Row(
                      children: ["My Movies", "Ok"]
                          .map(
                            (button) => Flexible(
                              child: TouchableOpacity(
                                onTap: () async {
                                  Navigator.popUntil(
                                    context,
                                    (route) {
                                      return route.settings.name == "home";
                                    },
                                  );
                                  if (button != ReservationScreenMessages.ok) {
                                    await 50.milliseconds.delay;
                                    Navigator.pushNamed(context, "myMovies");
                                  }
                                },
                                behavior: HitTestBehavior.translucent,
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(
                                    AppDimensions.padding * 2,
                                  ),
                                  child: Center(
                                    child: Text(
                                      App.translate(
                                        button.toUpperCase(),
                                        context,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    Navigator.popUntil(
      context,
      (route) => route.settings.name == "home",
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: 0,
      right: 0,
      duration: 300.milliseconds,
      bottom: AppDimensions.padding * (1 > 0 ? 0 : -12),
      child: Container(
        decoration: BoxDecoration(
          gradient: CommonProps.bottomBgGradient,
        ),
        padding: EdgeInsets.all(AppDimensions.padding * 2),
        child: Hero(
          tag: "btn",
          child: GestureDetector(
            onTap: () => this.onTap(context),
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.primary,
                borderRadius: BorderRadius.circular(40.0),
              ),
              padding: EdgeInsets.symmetric(
                vertical: AppDimensions.padding * 2,
              ),
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    App.translate(ReservationScreenMessages.bookNow),
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
    );
  }
}
