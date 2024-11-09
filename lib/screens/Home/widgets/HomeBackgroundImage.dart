import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/static/movies.dart' as movies;

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/App.dart';
import 'package:invmovieconcept1/Utils.dart';

import 'CircularRevealClipper.dart';

import '../Dimensions.dart';
import '../provider.dart';
import '../Theme.dart';

class HomeBackgroundImage extends StatelessWidget {
  static const double SHIFT = 0.50;

  HomeBackgroundImage({required this.scrollable});

  final double scrollable;

  double getOffsetX(double parallax, [rtl = true]) {
    double x;
    if (!App.isLtr && rtl) {
      x = 0.0 + (AppDimensions.maxContainerWidth * parallax * SHIFT);
    } else {
      x = AppDimensions.maxContainerWidth -
          (AppDimensions.maxContainerWidth * parallax * SHIFT);
    }

    return x;
  }

  double getOffsetY(double parallax) {
    final y = Dimensions.bgHeight - (Dimensions.bgHeight * parallax * SHIFT);
    return y;
  }

  double safeParallax(int index, double parallax) {
    if (index == 0 && parallax < 1.0) {
      return 1.0;
    }
    return parallax;
  }

  double maxRadius(int index, double parallax) {
    final x = this.getOffsetY(parallax);
    final y = this.getOffsetX(parallax, false);
    final a = math.pow(Dimensions.bgHeight - x, 2);
    final b = math.pow(AppDimensions.maxContainerWidth - y, 2);
    final bgClipRadius = math.sqrt(a + b);

    return bgClipRadius;
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeProvider>(context, listen: true);

    return Align(
      alignment: Alignment.topCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(48.0),
        ),
        child: Container(
          width: double.infinity,
          height: Dimensions.bgHeight,
          child: Stack(
            fit: StackFit.expand,
            children: movies.list.asMap().entries.map(
              (movie) {
                final index = movie.key;
                // Optimization
                final prevCheck = state.activeMovieIndex > 1 &&
                    index < state.activeMovieIndex - 1;
                final nextCheck =
                    state.activeMovieIndex < movies.list.length - 1 &&
                        index > state.activeMovieIndex + 1;
                if (prevCheck || nextCheck) {
                  return SizedBox();
                }

                final parallax = Utils.rangeMap(
                  state.offset,
                  (index - 1) * this.scrollable,
                  (index) * this.scrollable,
                  0.0,
                  1.0,
                  safe: true,
                );

                double scale = Utils.rangeL2LMap(
                  state.offset,
                  (index - 1) * this.scrollable,
                  (index) * this.scrollable,
                  (index + 1) * this.scrollable,
                  1,
                  0.0,
                  1,
                );

                double cScale = (scale * -0.6) + 1.125;
                double radiusFraction = parallax;

                if (index == 0 && state.offset < 0.0) {
                  radiusFraction = 1.0;
                }

                final safeParallax = this.safeParallax(index, parallax);

                double offsetX = this.getOffsetX(safeParallax);
                double offsetY = this.getOffsetY(safeParallax);

                return ClipPath(
                  clipper: CircularRevealClipper(
                    fraction: radiusFraction,
                    centerOffset: Offset(
                      offsetX,
                      offsetY,
                    ),
                    minRadius: 0,
                    maxRadius: this.maxRadius(index, safeParallax),
                  ),
                  child: Transform(
                    origin: Offset(
                      AppDimensions.maxContainerWidth / 2,
                      Dimensions.bgHeight / 2,
                    ),
                    transform: Matrix4.rotationZ(scale * 0.66)
                      ..scale(
                        cScale,
                        cScale,
                      ),
                    child: Container(
                      child: Image.asset(
                        movie.value.image,
                        fit: BoxFit.cover,
                      ),
                      foregroundDecoration: BoxDecoration(
                        color: HomeTheme.homeImageBg.withOpacity(
                          (parallax * HomeTheme.homeImageBgOpacity),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
