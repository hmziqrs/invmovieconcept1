import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/static/movies.dart' as movies;

import 'package:invmovieconcept1/configs/AppDimensions.dart';

import '../Dimensions.dart';
import '../provider.dart';
import '../Theme.dart';

class HomeMovieTags extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeProvider>(context, listen: true);

    return Positioned(
      left: 0,
      right: 0,
      top: Dimensions.bgHeight +
          Dimensions.ratingRadius / 2 +
          Dimensions.bannerAdHeight,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.padding,
          vertical: AppDimensions.padding * 2,
        ),
        child: Wrap(
          key: Key(state.activeMovieIndex.toString()),
          children: [
            ...movies.list[state.activeMovieIndex].tags
                .asMap()
                .entries
                .map(
                  (entry) => PlayAnimation<double>(
                    curve: Curves.easeInOut,
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: Duration(milliseconds: 280),
                    delay: Duration(milliseconds: 80 * entry.key),
                    builder: (context, _, animation) {
                      return Opacity(
                        opacity: animation,
                        child: Container(
                          margin: EdgeInsets.all(
                            AppDimensions.padding,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: AppDimensions.padding * 1.5,
                            horizontal: AppDimensions.padding * 4,
                          ),
                          decoration: BoxDecoration(
                            color: HomeTheme.tagsBackground,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                spreadRadius: 0,
                                offset: Offset(2.0, 2.0),
                                color: HomeTheme.tagsShadow,
                              ),
                            ],
                          ),
                          child: Text(
                            entry.value,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
