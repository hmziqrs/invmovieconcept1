import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/static/movies.dart' as movies;

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/Utils.dart';
import 'package:tinycolor/tinycolor.dart';

import '../Dimensions.dart';
import '../provider.dart';

class HomeMovieRatings extends StatelessWidget {
  HomeMovieRatings({@required this.scrollable});
  final double scrollable;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeProvider>(context, listen: false);

    return Positioned(
      left: 0,
      right: 0,
      top: Dimensions.bgHeight - Dimensions.ratingRadius / 2,
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          children: movies.list.asMap().entries.map(
            (entry) {
              final index = entry.key;

              double opacity = Utils.rangeL2LMap(
                state.offset,
                (index - 1) * this.scrollable,
                (index) * this.scrollable,
                (index + 1) * this.scrollable,
                0,
                1.0,
                0,
              ).clamp(0.0, 1.0);

              double parallax = Utils.rangeMap(
                state.offset,
                index * this.scrollable,
                (index + 1) * this.scrollable,
                0.0,
                1.0,
              );

              // Bounce scroll Patch
              if ((index == 0 && state.offset < 0.0) ||
                  (index == movies.list.length - 1 &&
                      state.controller?.position?.maxScrollExtent != null &&
                      state.offset >
                          state.controller.position.maxScrollExtent)) {
                opacity = 1.0;
              }

              return Transform(
                transform: Matrix4.rotationZ(parallax * 3.3)
                  ..scale(
                    parallax + 1,
                    parallax + 1,
                  ),
                origin: Offset(
                  Dimensions.ratingRadius / 2,
                  Dimensions.ratingRadius / 2,
                ),
                child: Opacity(
                  opacity: opacity,
                  child: Container(
                    alignment: Alignment.center,
                    width: Dimensions.ratingRadius,
                    height: Dimensions.ratingRadius,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(Dimensions.ratingRadius),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6,
                          spreadRadius: 0,
                          offset: Offset(0.0, 2.0),
                          color: Colors.black.withOpacity(0.12),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Text(
                          entry.value.ratings.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
