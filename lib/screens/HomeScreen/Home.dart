import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/static/movies.dart' as movies;
import 'package:invmovieconcept1/Utils.dart';

import 'package:invmovieconcept1/widgets/Screen/Screen.dart';

import 'widgets/HomeBackgroundImage.dart';
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
                  color: Colors.red,
                  width: Dimensions.containerWidth,
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      HomeBackgroundImage(scrollable: scrollable),
                      PageView.builder(
                        clipBehavior: Clip.none,
                        controller: state.controller
                          ..addListener(
                            () {
                              state.offset = state.controller.offset;
                            },
                          ),
                        itemCount: movies.list.length,
                        // onPageChanged: (index) => state.activeIndex = index,
                        itemBuilder: (ctx, index) {
                          final movie = movies.list[index];

                          final scrollMin = (index - 1) * scrollable;
                          final scrollCurrent = (index) * scrollable;
                          final scrollMax = (index + 1) * scrollable;

                          double min2max = Utils.rangeMap(
                            state.offset,
                            scrollMin,
                            scrollMax,
                            -1,
                            1,
                          );

                          double min2min = Utils.rangeL2LMap(
                            state.offset,
                            scrollMin,
                            scrollCurrent,
                            scrollMax,
                            0,
                            1.0,
                            0,
                          );

                          double offsetX = Utils.rangeMap(
                            state.offset,
                            (index - 1) * scrollable,
                            (index) * scrollable,
                            0.0,
                            Dimensions.cardWidth,
                            safe: true,
                          );

                          double scaleBase = (min2min * 0.22) + 0.78;
                          double scaleImage = (min2min * -0.60) + 1.60;

                          return Container(
                            alignment: Alignment.center,
                            child: Transform(
                              origin: Offset(
                                offsetX,
                                Dimensions.cardHeight,
                              ),
                              transform: Matrix4.rotationZ(min2max * -0.33)
                                ..scale(scaleBase, scaleBase),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24.0),
                                child: Container(
                                  height: Dimensions.cardHeight,
                                  width: Dimensions.cardWidth,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                  ),
                                  child: Transform(
                                    origin: Offset(
                                      Dimensions.cardWidth / 2,
                                      Dimensions.cardHeight / 2,
                                    ),
                                    transform: Matrix4.identity()
                                      ..scale(scaleImage),
                                    child: Image.asset(
                                      movie.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      HomeHeader(),
                      HomeTabBar(),
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
