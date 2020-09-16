import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/widgets/Screen/Screen.dart';

import 'widgets/HomeBackgroundImage.dart';
import 'widgets/HomeMovieRatings.dart';
import 'widgets/HomeMovieCards.dart';
import 'widgets/HomeMovieName.dart';
import 'widgets/HomeMovieTags.dart';
import 'widgets/HomeBannerAd.dart';
import 'widgets/HomeHeader.dart';
import 'widgets/HomeTabBar.dart';

import 'Dimensions.dart';
import 'provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      Dimensions.init,
      scaffoldBackgroundColor: Colors.white,
      builder: (_) => ChangeNotifierProvider<HomeProvider>(
        create: (_) => HomeProvider(),
        child: SingleChildScrollView(
          child: Container(
            height: Dimensions.containerHeight,
            child: Align(
              child: Container(
                width: Dimensions.containerWidth,
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    HomeBackgroundImage(scrollable: Dimensions.scrollable),
                    HomeMovieCards(scrollable: Dimensions.scrollable),
                    HomeHeader(),
                    HomeTabBar(),
                    HomeMovieName(scrollable: Dimensions.scrollable),
                    HomeMovieRatings(scrollable: Dimensions.scrollable),
                    HomeBannerAd(),
                    HomeMovieTags(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
