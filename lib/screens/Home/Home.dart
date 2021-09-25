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
import '../../widgets/ads/banner_ad.dart';
import 'widgets/HomeHeader.dart';
import 'widgets/HomeTabBar.dart';

import 'FadeProvider.dart';
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
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeProvider()),
          ChangeNotifierProvider(create: (_) => HomeFadeProvider()),
        ],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: Dimensions.bgHeight,
                child: Stack(
                  children: [
                    HomeBackgroundImage(scrollable: Dimensions.scrollable),
                    HomeHeader(),
                    HomeTabBar(),
                    HomeMovieCards(scrollable: Dimensions.scrollable),
                    HomeMovieName(scrollable: Dimensions.scrollable),
                  ],
                ),
              ),

              // HomeMovieRatings(scrollable: Dimensions.scrollable),
              // AppBannerAd(),
              // HomeMovieTags(),
            ],
          ),
        ),
      ),
    );
  }
}
