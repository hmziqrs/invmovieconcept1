import 'package:flutter/material.dart';

import 'package:invmovieconcept1/models/MovieObject.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/App.dart';

import '../Dimensions.dart';
import 'MDReveal.dart';

class MovieInfoCard extends StatelessWidget {
  MovieInfoCard({
    @required this.movie,
  });
  final MovieObject movie;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(24.0);

    final topBaseOffset = Dimensions.cardHeight -
        Dimensions.infoHeight -
        AppDimensions.padding * 7;

    return Padding(
      padding: EdgeInsets.only(
        top: topBaseOffset,
        left: AppDimensions.padding * 2,
        right: AppDimensions.padding * 2,
        bottom: AppDimensions.padding * 2,
      ),
      child: MDReveal(
        delay: 600,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: Dimensions.infoHeight,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 3,
                ),
                decoration: BoxDecoration(
                  borderRadius: radius,
                  color: AppTheme.background2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppDimensions.padding * 3),
                    Text(
                      movie.name,
                      style: TextStyles.heading3,
                    ),
                    SizedBox(height: AppDimensions.padding * 2),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: TextStyles.body2.fontSize,
                        ),
                        SizedBox(width: AppDimensions.padding * 2),
                        Text(
                          "${movie.ratings}    PG| 1h 42m    25 Dec 2019",
                          style: TextStyles.body27.copyWith(
                            color: AppTheme.subText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppDimensions.padding * 1),
                    Wrap(
                      children: movie.tags
                          .map((e) => Container(
                                margin: EdgeInsets.all(
                                  AppDimensions.padding,
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: AppDimensions.padding * 1,
                                  horizontal: AppDimensions.padding * 3,
                                ),
                                decoration: BoxDecoration(
                                    color: AppTheme.background2,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      width: 1,
                                      color: AppTheme.text.withOpacity(0.08),
                                    )),
                                child: Text(
                                  App.translate(e, context),
                                  style: TextStyles.body26.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    SizedBox(height: AppDimensions.padding * 4),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: -Dimensions.infoIconRadius * 0.5 - AppDimensions.padding * 3,
              // top: Dimensions.infoIconRadius,
              child: Material(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: AppDimensions.padding * 3,
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: SizedBox(width: double.infinity),
                      ),
                      InkResponse(
                        highlightColor: AppTheme.primary.withOpacity(0.1),
                        radius: Dimensions.infoIconRadius * 0.8,
                        onTap: () {},
                        child: Container(
                          width: Dimensions.infoIconRadius,
                          height: Dimensions.infoIconRadius,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppTheme.dark,
                            size: Dimensions.infoIconRadius * 0.65,
                          ),
                        ),
                      ),
                      SizedBox(width: AppDimensions.padding * 3),
                      InkResponse(
                        highlightColor: AppTheme.primary.withOpacity(0.1),
                        radius: Dimensions.infoIconRadius * 0.8,
                        onTap: () {},
                        child: Container(
                          width: Dimensions.infoIconRadius,
                          height: Dimensions.infoIconRadius,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppTheme.background,
                          ),
                          child: Icon(
                            Icons.star_outline,
                            color: AppTheme.subText3,
                            size: Dimensions.infoIconRadius * 0.65,
                          ),
                        ),
                      ),
                      SizedBox(width: AppDimensions.padding * 6),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
