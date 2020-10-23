import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';

import '../Dimensions.dart';
import 'MDReveal.dart';

class MovieDetailCast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MDReveal(
      delay: 1000,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.padding * 3,
            ),
            child: Text(
              "Cast",
              style: TextStyles.heading3,
            ),
          ),
          SizedBox(height: AppDimensions.padding * 2),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.padding * 1.5,
            ),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                14,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.padding * 1.5,
                  ),
                  child: Column(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        width: Dimensions.castRadius,
                        height: Dimensions.castRadius,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/avatars/rick.jpg",
                        ),
                      ),
                      SizedBox(height: AppDimensions.padding),
                      Text(
                        "Cast Name",
                        style: TextStyles.body36.copyWith(
                          color: AppTheme.subText2,
                        ),
                      ),
                    ],
                  ),
                ),
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
