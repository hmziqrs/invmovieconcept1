import 'package:flutter/material.dart';
import 'package:invmovieconcept1/UI.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              color: Colors.black,
            ),
            onPressed: () => null,
          ),
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            icon: Icon(
              Icons.search_outlined,
              color: Colors.black,
            ),
            onPressed: () => null,
          )
        ],
      ),
    );
  }
}
