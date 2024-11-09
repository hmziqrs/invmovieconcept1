import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/App.dart';
import 'package:invmovieconcept1/UI.dart';

import '../FadeProvider.dart';
import '../provider.dart';

class HomeTabBar extends StatefulWidget {
  @override
  _HomeTabBarState createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    this.tabController = TabController(
      vsync: this,
      length: HomeProvider.tabs.length,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeProvider>(context);
    final fadeState = Provider.of<HomeFadeProvider>(context, listen: true);

    return Positioned(
      left: AppDimensions.padding * 1.5,
      right: AppDimensions.padding * 1.5,
      top: UI.padding.top + (AppDimensions.padding * 7.5),
      child: Material(
        color: Colors.transparent,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 280),
          opacity: !fadeState.fadeOff ? 1.0 : 0.0,
          child: TabBar(
            indicator: null,
            isScrollable: true,
            controller: this.tabController,
            physics: BouncingScrollPhysics(),
            labelPadding: EdgeInsets.all(0.0),
            indicatorColor: Colors.transparent,
            onTap: (index) => state.activeTabIndex = index,
            tabs: HomeProvider.tabs.asMap().entries.map(
              (entry) {
                final left = AppDimensions.padding * (App.isLtr ? 1 : 5);
                final right = AppDimensions.padding * (!App.isLtr ? 1 : 5);

                return GestureDetector(
                  onTap: () => state.activeTabIndex = entry.key,
                  child: Container(
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: AppDimensions.padding * 0.8,
                          ),
                          margin: EdgeInsets.only(
                            left: left,
                            right: right,
                          ),
                          child: Text(
                            App.translate(entry.value, context),
                            style: DefaultTextStyle.of(context).style.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10 + AppDimensions.ratio * 5,
                                ),
                          ),
                        ),
                        Positioned(
                          left: App.isLtr ? left * 1.2 : null,
                          right: !App.isLtr ? right * 1.2 : null,
                          bottom: 0,
                          child: CustomAnimationBuilder<double>(
                            curve: Curves.easeIn,
                            tween: Tween(begin: 0.0, end: 1.0),
                            duration: Duration(milliseconds: 220),
                            control: entry.key == state.activeTabIndex
                                ? Control.play
                                : Control.playReverse,
                            builder: (context, animation, _) {
                              return Opacity(
                                opacity: animation,
                                child: Container(
                                  color: Theme.of(context).primaryColor,
                                  height: AppDimensions.ratio * 1.5,
                                  width: animation *
                                      ((AppDimensions.ratio * 20) + 5),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
