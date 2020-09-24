import 'package:flutter/material.dart';
import 'package:invmovieconcept1/UI.dart';
import 'package:provider/provider.dart';

import '../provider.dart';
import '../Theme.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeProvider>(context, listen: false);

    return Positioned(
      left: 0,
      right: 0,
      top: UI.mediaQuery().padding.top,
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
            onPressed: () => (state.isDrawerOpen = true),
          ),
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            icon: Icon(
              Icons.search_outlined,
            ),
            onPressed: () => null,
          )
        ],
      ),
    );
  }
}
