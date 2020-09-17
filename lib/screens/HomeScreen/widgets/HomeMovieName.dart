import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/static/movies.dart' as movies;

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/Utils.dart';

import '../Dimensions.dart';
import '../provider.dart';

class HomeMovieName extends StatelessWidget {
  HomeMovieName({@required this.scrollable});
  final double scrollable;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeProvider>(context, listen: true);

    return Positioned(
      left: 0,
      right: 0,
      top: Dimensions.bgHeight - AppDimensions.padding * 16,
      child: Container(
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

              // Bounce scroll Patch
              final checkMin = (index == 0 && state.offset < 0.0);
              final checkMax = (index == movies.list.length - 1 &&
                  state.controller?.position?.hasPixels &&
                  state.offset > state.controller.position?.maxScrollExtent);
              if (checkMin || checkMax) {
                opacity = 1.0;
              }

              return Container(
                alignment: Alignment.center,
                child: Opacity(
                  opacity: opacity,
                  child: Text(
                    entry.value.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: AppDimensions.ratio * 10 + 6,
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
