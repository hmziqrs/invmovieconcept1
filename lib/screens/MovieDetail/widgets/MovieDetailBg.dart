import 'package:flutter/material.dart';
import 'package:invmovieconcept1/models/MovieObject.dart';
import 'package:invmovieconcept1/screens/MovieDetail/provider.dart';

import '../Dimensions.dart';

class MovieDetailBg extends StatelessWidget {
  MovieDetailBg({
    @required this.movie,
  });
  final MovieObject movie;

  @override
  Widget build(BuildContext context) {
    final state = MovieDetailProvider.state(context, true);
    double height = (Dimensions.cardHeight - (state.offset * 1.8));
    final reduceBreakPoint = Dimensions.cardHeight * 0.30;

    if (state.offset > reduceBreakPoint) {
      final pad = (state.offset - reduceBreakPoint);
      // print("$pad ${state.offset}");
      height = height + pad;
    }
    if (height > Dimensions.cardHeight) {
      height = Dimensions.cardHeight - state.offset;
    }
    if (height < 0.0) {
      height = 0.0;
    }

    final radius = BorderRadius.circular(24.0);
    return Positioned(
      top: Dimensions.cardOffset,
      child: Hero(
        tag: movie.name,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: radius,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: Offset(0, 8),
                color: Colors.black.withOpacity(0.3),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: radius,
            child: Container(
              height: height,
              width: Dimensions.cardWidth,
              child: Image.asset(
                movie.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
