import 'dart:math' show Random;

import 'package:flutter/material.dart';

import 'package:invmovieconcept1/models/MovieObject.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';

import 'SSReveal.dart';

class SelectSeatsHeader extends StatelessWidget {
  SelectSeatsHeader({
    required this.movie,
  });

  final MovieObject movie;

  @override
  Widget build(BuildContext context) {
    final r = Random();
    final H = 1 + r.nextInt(1);
    final M = r.nextInt(45);

    return SSReveal(
      delay: 1,
      child: Row(
        children: [
          SizedBox(width: AppDimensions.padding * 3),
          Text(this.movie.name, style: TextStyles.heading3),
          Flexible(child: SizedBox(width: double.infinity)),
          Container(
            decoration: BoxDecoration(
              color: Colors.pink[500],
              borderRadius: BorderRadius.circular(5.0),
            ),
            padding: EdgeInsets.symmetric(
              vertical: AppDimensions.padding * 1,
              horizontal: AppDimensions.padding * 2,
            ),
            child: Text(
              "${H}h ${M}m",
              style: TextStyles.body27.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: AppDimensions.padding * 3),
        ],
      ),
    );
  }
}
