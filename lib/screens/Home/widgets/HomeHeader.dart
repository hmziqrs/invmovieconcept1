import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/UI.dart';

import '../FadeProvider.dart';
import '../TestKeys.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final y = UI.mediaQuery().padding.top;
    return Selector<HomeFadeProvider, bool>(
        selector: (ctx, state) => state.fadeOff,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              key: Key(HomeTestKeys.drawerButton),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            IconButton(
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              icon: Icon(Icons.search_outlined),
              highlightColor: Colors.transparent,
              key: Key(HomeTestKeys.searchButton),
              onPressed: () => Navigator.of(context).pushNamed("search"),
            )
          ],
        ),
        builder: (context, fadeOff, child) {
          return AnimatedPositioned(
            left: 0,
            right: 0,
            duration: HomeFadeProvider.microDuration,
            top: !fadeOff ? y : -(y + AppDimensions.padding * 3),
            child: AnimatedOpacity(
              child: child,
              opacity: !fadeOff ? 1.0 : 0.0,
              duration: HomeFadeProvider.microDuration,
            ),
          );
        });
  }
}
