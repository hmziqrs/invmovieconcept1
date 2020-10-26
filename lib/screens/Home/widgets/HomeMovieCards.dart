import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/static/movies.dart' as movies;

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/App.dart';

import 'package:invmovieconcept1/Utils.dart';
import 'package:invmovieconcept1/UI.dart';

import '../FadeProvider.dart';
import '../Dimensions.dart';
import '../provider.dart';

enum AnimationMap {
  offsetX,
  min2max,
  min2min,
  scaleBase,
  scaleImage,
}

class HomeMovieCards extends StatelessWidget {
  HomeMovieCards({@required this.scrollable});
  final double scrollable;

  Map<AnimationMap, double> getAnimations(HomeProvider state, index) {
    final scrollMin = (index - 1) * this.scrollable;
    final scrollCurrent = (index) * this.scrollable;
    final scrollMax = (index + 1) * this.scrollable;

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

    double scaleBase = (min2min * 0.22) + 0.78;
    double scaleImage = (min2min * -0.60) + 1.60;

    double offsetX = Utils.rangeMap(
      state.offset,
      (index - 1) * this.scrollable,
      (index) * this.scrollable,
      0.0,
      Dimensions.cardWidth,
      safe: true,
    );

    if (!App.isLtr) {
      offsetX = Utils.rangeMap(
        state.offset,
        (index) * this.scrollable,
        (index - 1) * this.scrollable,
        0.0,
        Dimensions.cardWidth,
        safe: true,
      );
    }

    return {
      AnimationMap.offsetX: offsetX,
      AnimationMap.min2min: min2min,
      AnimationMap.min2max: min2max,
      AnimationMap.scaleBase: scaleBase,
      AnimationMap.scaleImage: scaleImage,
    };
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeProvider>(context, listen: true);

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: UI.mediaQuery().padding.top + AppDimensions.padding * 20,
      child: NotificationListener<SizeChangedLayoutNotification>(
        onNotification: (notification) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            state.offset = state.controller.offset;
          });
          return false;
        },
        child: SizeChangedLayoutNotifier(
          child: PageView.builder(
            clipBehavior: Clip.none,
            physics: BouncingScrollPhysics(),
            itemCount: movies.list.length,
            onPageChanged: (index) => state.activeMovieIndex != index
                ? state.activeMovieIndex = index
                : null,
            controller: state.controller
              ..addListener(
                () {
                  state.offset = state.controller.offset;
                },
              ),
            itemBuilder: (ctx, index) {
              final movie = movies.list[index];
              final animations = this.getAnimations(state, index);

              final isPrev = state.activeMovieIndex > 0 &&
                  index == state.activeMovieIndex - 1;
              final isNext = state.activeMovieIndex < movies.list.length - 1 &&
                  index == state.activeMovieIndex + 1;

              return Container(
                alignment: Alignment.topCenter,
                child: Consumer<HomeFadeProvider>(
                  // selector: (_, state) => state.fadeOff,
                  builder: (context, fadeState, child) {
                    return CustomAnimation<double>(
                      duration: HomeFadeProvider.microDuration,
                      tween: Tween(begin: 0.0, end: 1.0),
                      control: fadeState.fadeOff && (isPrev || isNext)
                          ? CustomAnimationControl.PLAY
                          : CustomAnimationControl.PLAY_REVERSE,
                      builder: (ctx, child, animation) {
                        double translateX = 0.0;
                        if (isPrev) {
                          translateX = Dimensions.cardWidth * 0.69 * -animation;
                        }
                        if (isNext) {
                          translateX = Dimensions.cardWidth * 0.69 * animation;
                        }

                        return Transform(
                          origin: Offset(
                            animations[AnimationMap.offsetX],
                            Dimensions.cardHeight,
                          ),
                          transform: Matrix4.rotationZ(
                            animations[AnimationMap.min2max] *
                                0.33 *
                                (App.isLtr ? -1 : 1),
                          )
                            ..scale(
                              animations[AnimationMap.scaleBase],
                              animations[AnimationMap.scaleBase],
                            )
                            ..translate(translateX),
                          child: GestureDetector(
                            onTap: () async {
                              if (index == state.activeMovieIndex) {
                                fadeState.setFade(true);
                                await 200.milliseconds.delay;
                                await Navigator.of(context).pushNamed(
                                  "movieDetail",
                                  arguments: movie,
                                );
                                await 300.milliseconds.delay;
                                fadeState.setFade(false);
                              }
                            },
                            child: Hero(
                              tag: movie.name,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.0),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      offset: Offset(0, 8),
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius:
                                          animations[AnimationMap.min2min] * 1,
                                    )
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Container(
                                    height: Dimensions.cardHeight,
                                    width: Dimensions.cardWidth,
                                    child: Transform(
                                      origin: Offset(
                                        Dimensions.cardWidth / 2,
                                        Dimensions.cardHeight / 2,
                                      ),
                                      transform: Matrix4.identity()
                                        ..scale(
                                          animations[AnimationMap.scaleImage],
                                        ),
                                      child: Image.asset(
                                        movie.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
