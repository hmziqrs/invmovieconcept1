import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/widgets/Screen/Screen.dart';

import 'widgets/HomeBackgroundImage.dart';
import 'widgets/HomeMovieRatings.dart';
import 'widgets/HomeMovieCards.dart';
import 'widgets/HomeMovieName.dart';
import 'widgets/HomeMovieTags.dart';
import 'widgets/HomeTabBar.dart';
import 'widgets/HomeHeader.dart';

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
        child: Consumer<HomeProvider>(builder: (context, state, _) {
          // final scrollable = state.controller.viewportFraction * UI.width;
          // final scrollable = Dimensions.containerWidth;
          final scrollable =
              Dimensions.containerWidth * HomeProvider.viewportFraction;

          return NotificationListener<LayoutChangedNotification>(
            onNotification: (notification) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                state.offset = state.controller.offset;
              });
              return false;
            },
            child: SizeChangedLayoutNotifier(
              child: Align(
                child: Container(
                  width: Dimensions.containerWidth,
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      HomeBackgroundImage(scrollable: scrollable),
                      HomeMovieCards(scrollable: scrollable),
                      HomeHeader(),
                      HomeTabBar(),
                      HomeMovieName(scrollable: scrollable),
                      HomeMovieRatings(scrollable: scrollable),
                      HomeMovieTags(),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
