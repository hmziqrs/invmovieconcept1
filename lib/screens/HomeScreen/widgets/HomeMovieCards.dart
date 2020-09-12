import 'package:flutter/material.dart';
import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/static/movies.dart' as movies;

import 'package:invmovieconcept1/Utils.dart';
import 'package:invmovieconcept1/UI.dart';

import '../Dimensions.dart';
import '../provider.dart';

class HomeMovieCards extends StatelessWidget {
  HomeMovieCards({@required this.scrollable});
  final double scrollable;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeProvider>(context, listen: false);

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: UI.mediaQuery().padding.top + AppDimensions.padding * 20,
      child: PageView.builder(
        clipBehavior: Clip.none,
        physics: BouncingScrollPhysics(),
        itemCount: movies.list.length,
        onPageChanged: (index) => state.activeMovieIndex != index
            ? state.activeMovieIndex = index
            : null,
        controller: state.controller
          ..addListener(
            () {
              state.offset = state.controller.offset;
            },
          ),
        itemBuilder: (ctx, index) {
          final movie = movies.list[index];

          final scrollMin = (index - 1) * this.scrollable;
          final scrollCurrent = (index) * this.scrollable;
          final scrollMax = (index + 1) * this.scrollable;

          double min2max = Utils.rangeMap(
            state.offset,
            scrollMin,
            scrollMax,
            -1,
            1,
          );

          double min2min = Utils.rangeL2LMap(
            state.offset,
            scrollMin,
            scrollCurrent,
            scrollMax,
            0,
            1.0,
            0,
          );

          double offsetX = Utils.rangeMap(
            state.offset,
            (index - 1) * this.scrollable,
            (index) * this.scrollable,
            0.0,
            Dimensions.cardWidth,
            safe: true,
          );

          double scaleBase = (min2min * 0.22) + 0.78;
          double scaleImage = (min2min * -0.60) + 1.60;

          return Container(
            alignment: Alignment.topCenter,
            child: Transform(
              origin: Offset(
                offsetX,
                Dimensions.cardHeight,
              ),
              transform: Matrix4.rotationZ(min2max * -0.33)
                ..scale(scaleBase, scaleBase),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: min2min * 1,
                      offset: Offset(0, 8),
                      color: Colors.black.withOpacity(0.3),
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: Container(
                    height: Dimensions.cardHeight,
                    width: Dimensions.cardWidth,
                    child: Transform(
                      origin: Offset(
                        Dimensions.cardWidth / 2,
                        Dimensions.cardHeight / 2,
                      ),
                      transform: Matrix4.identity()..scale(scaleImage),
                      child: Image.asset(
                        movie.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
