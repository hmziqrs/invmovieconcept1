import 'dart:math' show Random;

import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:invmovieconcept1/io/io.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:intl/intl.dart';

import 'package:invmovieconcept1/models/MovieTicket.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/App.dart';

import '../messages/keys.dart';
import '../provider.dart';

class MyMovieCard extends StatefulWidget {
  MyMovieCard({
    @required this.reservation,
  });
  final MovieTicket reservation;

  @override
  _MyMovieCardState createState() => _MyMovieCardState();
}

class _MyMovieCardState extends State<MyMovieCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final state = MyMoviesProvider.state(context, true);
    final movie = widget.reservation.movie;
    return ConditionalWillPopScope(
      shouldAddCallback: Platform.isAndroid,
      onWillPop: () async {
        state.setFade(true);
        await 80.milliseconds.delay;
        return true;
      },
      child: Stack(
        children: [
          CustomAnimation<Alignment>(
            control: this.isHover || state.fadeOff
                ? CustomAnimationControl.STOP
                : CustomAnimationControl.MIRROR,
            tween: Tween(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            duration: (60 + Random().nextInt(30)).seconds,
            builder: (context, child, animation) {
              return Positioned.fill(
                child: Container(
                  width: double.infinity,
                  color: Colors.red,
                  child: Image.asset(
                    movie.image,
                    alignment: animation,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          CustomAnimation<double>(
            control: this.isHover
                ? CustomAnimationControl.STOP
                : CustomAnimationControl.MIRROR,
            tween: 0.0.tweenTo(1.0),
            duration: 4.seconds,
            builder: (context, child, animation) {
              return Positioned.fill(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned.fill(
                      child: Opacity(
                        opacity: animation,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppTheme.primary.withOpacity(0.99),
                                AppTheme.primary.withOpacity(0.7),
                                AppTheme.primary.withOpacity(0.4),
                                AppTheme.primary.withOpacity(0.01),
                                // Colors.red,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Opacity(
                        opacity: 1 - animation,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                AppTheme.primary.withOpacity(0.99),
                                AppTheme.primary.withOpacity(0.7),
                                AppTheme.primary.withOpacity(0.4),
                                AppTheme.primary.withOpacity(0.01),
                                // Colors.red,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          InkWell(
            onTap: () async {
              state.setFade(true);
              await 180.milliseconds.delay;
              await Navigator.pushNamed(
                context,
                "selectSeats",
                arguments: {
                  "reservation": widget.reservation,
                  "movie": widget.reservation.movie,
                },
              );
              await 180.milliseconds.delay;
              state.setFade(false);
            },
            onHover: (hover) {
              setState(() {
                this.isHover = hover;
              });
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 3.6,
                vertical: AppDimensions.padding * 3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        movie.name,
                        style: TextStyles.heading56.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        DateFormat("d-M H:mm a")
                            .format(widget.reservation.time),
                        style: TextStyles.body16.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: AppDimensions.padding),
                  SizedBox(height: AppDimensions.padding),
                  Text(
                    App.translate(MyMoviesScreenMessages.seats, context),
                    style: TextStyles.body36.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: AppDimensions.padding),
                  Wrap(
                    children: [
                      Text(
                        widget.reservation.seats
                            .map(
                              (seat) =>
                                  String.fromCharCode(65 + seat.item1) +
                                  seat.item2.toString(),
                            )
                            .toList()
                            .join(", "),
                        style: TextStyles.body16.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
