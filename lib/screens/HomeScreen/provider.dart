import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  static double viewportFraction = 0.57;
  static List<String> tabs = [
    "In Theater",
    "Box Office",
    "Top 10",
    "Trending",
  ];

  double _offset = 0.0;
  int _activeMovieIndex = 0;
  int _activeTabIndex = 0;
  PageController controller = PageController(
    viewportFraction: viewportFraction,
  );
  bool _isDrawerOpen = false;

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

  bool get isDrawerOpen => this._isDrawerOpen;

  set isDrawerOpen(bool flag) {
    this._isDrawerOpen = flag;
    notifyListeners();
  }
}
