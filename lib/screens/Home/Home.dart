import 'package:flutter/material.dart';
import 'package:invmovieconcept1/providers/Reservation.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';

import 'package:invmovieconcept1/widgets/Screen/Screen.dart';

import 'widgets/HomeBackgroundImage.dart';
import 'widgets/Drawer/HomeDrawer.dart';
import 'widgets/HomeMovieRatings.dart';
import 'widgets/HomeMovieCards.dart';
import 'widgets/HomeMovieName.dart';
import 'widgets/HomeMovieTags.dart';
import 'widgets/HomeBannerAd.dart';
import 'widgets/HomeHeader.dart';
import 'widgets/HomeTabBar.dart';

import 'Dimensions.dart';
import 'provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    // This is to initialize reservations
    ReservationProvider.state(context);

    return Screen(
      drawer: HomeDrawer(),
      child: ChangeNotifierProvider<HomeProvider>(
        create: (_) => HomeProvider(),
        child: SingleChildScrollView(
          child: Container(
            height: Dimensions.containerHeight,
            child: Align(
              child: Container(
                width: AppDimensions.containerWidth,
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    HomeBackgroundImage(
                      scrollable: Dimensions.scrollable,
                    ),
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
