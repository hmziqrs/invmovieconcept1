import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/static/movies.dart' as movies;
import 'package:invmovieconcept1/Utils.dart';
import 'package:invmovieconcept1/UI.dart';

import 'package:invmovieconcept1/screens/HomeScreen/provider.dart';

import 'CircularRevealClipper.dart';

import '../Dimensions.dart';

class HomeBackgroundImage extends StatelessWidget {
  HomeBackgroundImage({this.scrollable});

  final double scrollable;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeProvider>(context, listen: false);
    return Align(
      alignment: Alignment.topCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(48.0),
        ),
        child: Container(
          color: Colors.green,
          width: double.infinity,
          height: Dimensions.bgHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ...movies.list.asMap().entries.map(
                (movie) {
                  final index = movie.key;
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

                  double cScale = (scale * -1) + 1.2;
                  if (index == 0)
                    print(
                        "$index $scale|$cScale ${state.offset} ${this.scrollable}");

                  return ClipPath(
                    clipper: CircularRevealClipper(
                      fraction: parallax,
                      centerOffset: Offset(
                        Dimensions.containerWidth,
                        Dimensions.bgHeight,
                      ),
                      minRadius: 0,
                      maxRadius: Dimensions.bgHeight * 1.25,
                    ),
                    child: Transform(
                      origin: Offset(
                        Dimensions.containerWidth / 2,
                        Dimensions.bgHeight / 2,
                      ),
                      transform: Matrix4.rotationZ(scale * 0.33)
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
                          color: Colors.white.withOpacity(
                            (parallax * 0.60),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
