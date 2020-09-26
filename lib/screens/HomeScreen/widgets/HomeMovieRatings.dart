import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/static/movies.dart' as movies;

import 'package:invmovieconcept1/Utils.dart';

import '../Dimensions.dart';
import '../provider.dart';
import '../Theme.dart';

class HomeMovieRatings extends StatelessWidget {
  HomeMovieRatings({@required this.scrollable});
  final double scrollable;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeProvider>(context, listen: true);

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

              double scale = parallax;

              // Bounce scroll Patch
              final checkMin = (index == 0 && state.offset < 0.0);
              final checkMax = (index == movies.list.length - 1 &&
                  state.controller.position.hasPixels &&
                  state.offset > state.controller.position?.maxScrollExtent);
              if (checkMin || checkMax) {
                opacity = 1.0;
                scale = 0.0;
              }

              return Opacity(
                opacity: opacity,
                child: Container(
                  transform: Matrix4.identity()
                    ..translate(
                      (scale * (-Dimensions.ratingRadius / 2)),
                      (scale * (-Dimensions.ratingRadius / 2)),
                    )
                    ..scale(
                      scale + 1,
                      scale + 1,
                    ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Dimensions.ratingRadius,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        spreadRadius: 0,
                        offset: Offset(0.0, 2.0),
                        color: HomeTheme.shadowWithBg,
                      ),
                    ],
                  ),
                  child: Transform(
                    transform: Matrix4.rotationZ(parallax * 3.3),
                    origin: Offset(
                      Dimensions.ratingRadius / 2,
                      Dimensions.ratingRadius / 2,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: Dimensions.ratingRadius,
                      height: Dimensions.ratingRadius,
                      decoration: BoxDecoration(
                        color: HomeTheme.background,
                        borderRadius: BorderRadius.circular(
                          Dimensions.ratingRadius,
                        ),
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
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
