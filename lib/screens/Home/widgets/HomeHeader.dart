import 'package:flutter/material.dart';
import 'package:invmovieconcept1/UI.dart';
import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/screens/Home/provider.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final y = UI.mediaQuery().padding.top;
    return Selector<HomeProvider, bool>(
        selector: (ctx, state) => state.fadeOff,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              icon: Icon(
                Icons.menu,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              icon: Icon(
                Icons.search_outlined,
              ),
              onPressed: () => Navigator.of(context).pushNamed("search"),
            )
          ],
        ),
        builder: (context, fadeOff, child) {
          return AnimatedPositioned(
            left: 0,
            right: 0,
            duration: HomeProvider.microDuration,
            top: !fadeOff ? y : -(y + AppDimensions.padding * 3),
            child: AnimatedOpacity(
              child: child,
              opacity: !fadeOff ? 1.0 : 0.0,
              duration: HomeProvider.microDuration,
            ),
          );
        });
  }
}
