import 'package:flutter/material.dart';
import 'package:invmovieconcept1/configs/App.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/UI.dart';
import 'package:simple_animations/simple_animations.dart';

import '../provider.dart';

class HomeTabBar extends StatefulWidget {
  @override
  _HomeTabBarState createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar>
    with SingleTickerProviderStateMixin {
  TabController tabController;

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
    return Positioned(
      left: AppDimensions.padding * 1.5,
      right: AppDimensions.padding * 1.5,
      top: UI.mediaQuery().padding.top + AppDimensions.padding * 8,
      child: TabBar(
        indicator: null,
        isScrollable: true,
        labelPadding: EdgeInsets.all(0.0),
        controller: this.tabController,
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
                        entry.value,
                        style: DefaultTextStyle.of(context).style.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                      ),
                    ),
                    Positioned(
                      left: App.isLtr ? left * 1.2 : null,
                      right: !App.isLtr ? right * 1.2 : null,
                      bottom: 0,
                      child: CustomAnimation<double>(
                        curve: Curves.easeIn,
                        tween: Tween(begin: 0.0, end: 1.0),
                        duration: Duration(milliseconds: 220),
                        control: entry.key == state.activeTabIndex
                            ? CustomAnimationControl.PLAY
                            : CustomAnimationControl.PLAY_REVERSE,
                        builder: (context, _, animation) {
                          return Opacity(
                            opacity: animation,
                            child: Container(
                              color: Theme.of(context).primaryColor,
                              height: AppDimensions.ratio * 1.5,
                              width:
                                  animation * ((AppDimensions.ratio * 20) + 5),
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
    );
  }
}
