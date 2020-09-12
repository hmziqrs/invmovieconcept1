import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  double _offset = 0.0;

  static double viewportFraction = 0.57;

  int _activeMovieIndex = 0;

  int _activeTabIndex = 0;
  static List<String> tabs = [
    "In Theater",
    "Box Office",
    "Top 10",
    "Trending",
  ];

  PageController controller = PageController(
    viewportFraction: viewportFraction,
  );

  int get activeTabIndex => this._activeTabIndex;

  set activeTabIndex(int index) {
    this._activeTabIndex = index;
    notifyListeners();
  }

  int get activeMovieIndex => this._activeMovieIndex;
  set activeMovieIndex(int index) {
    this._activeMovieIndex = index;
    notifyListeners();
  }

  double get offset => this._offset;

  set offset(double newOffset) {
    this._offset = newOffset;
    notifyListeners();
  }
}
