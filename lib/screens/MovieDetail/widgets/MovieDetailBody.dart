import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

import 'package:invmovieconcept1/screens/MovieDetail/TestKeys.dart';
import 'package:invmovieconcept1/widgets/ads/banner_ad.dart';
import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/models/MovieObject.dart';

import 'MDScrollPhysics.dart';
import 'MovieDetailCast.dart';
import 'MovieDetailDesc.dart';
import 'MovieInfoCard.dart';

import '../provider.dart';

class MovieDetailBody extends StatefulWidget {
  const MovieDetailBody({
    @required this.movie,
  });
  final MovieObject movie;

  @override
  _MovieDetailBodyState createState() => _MovieDetailBodyState();
}

class _MovieDetailBodyState extends State<MovieDetailBody> {
  final controller = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.addListener(() {
        final scrollX = controller.offset;
        MovieDetailProvider.state(context).offset = scrollX;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        MovieDetailProvider.state(context).setFade(true);
        await 360.milliseconds.delay;
        return true;
      },
      child: ListView(
        controller: controller,
        key: Key(MovieDetailTestKeys.scrollBody),
        physics: MDScrollPhysics(parent: BouncingScrollPhysics()),
        children: [
          MovieInfoCard(movie: widget.movie),
          SizedBox(height: AppDimensions.padding * 1),
          AppBannerAd(),
          SizedBox(height: AppDimensions.padding * 3),
          MovieDetailDesc(),
          SizedBox(height: AppDimensions.padding * 3),
          MovieDetailCast(),
          SizedBox(height: AppDimensions.padding * 15),
        ],
      ),
    );
  }
}
