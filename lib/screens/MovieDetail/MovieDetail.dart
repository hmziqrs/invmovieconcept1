import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/models/MovieObject.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';

import 'package:invmovieconcept1/widgets/Screen/Screen.dart';

import 'widgets/MovieDetailHeader.dart';
import 'widgets/MovieDetailSelectSeats.dart';
import 'widgets/MovieDetailBody.dart';
import 'widgets/MovieDetailBg.dart';

import 'Dimensions.dart';
import 'provider.dart';

class MovieDetailScreen extends StatefulWidget {
  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    final MovieObject movie = ModalRoute.of(context).settings.arguments;

    return Screen(
      child: Align(
        alignment: Alignment.topCenter,
        child: ChangeNotifierProvider<MovieDetailProvider>(
          create: (_) => MovieDetailProvider(),
          child: Container(
            width: AppDimensions.containerWidth,
            child: Stack(
              fit: StackFit.expand,
              children: [
                MovieDetailBg(movie: movie),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: MovieDetailBody(
                      movie: movie,
                    ),
                  ),
                ),
                MovieDetailHeader(),
                MovieDetailSelectSeats(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
