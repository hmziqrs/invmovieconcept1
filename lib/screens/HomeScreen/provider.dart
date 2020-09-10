import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int _activeIndex = 0;
  double _offset = 0.0;
  static double viewportFraction = 0.60;

  PageController controller = PageController(
    viewportFraction: viewportFraction,
  );

  HomeProvider() {
    // this.controller = ;
  }

  int get activeIndex => this._activeIndex;

  set activeIndex(int index) {
    this._activeIndex = index;
    notifyListeners();
  }

  double get offset => this._offset;

  set offset(double newOffset) {
    this._offset = newOffset;
    notifyListeners();
  }
}
