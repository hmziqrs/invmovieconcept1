import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieDetailProvider extends ChangeNotifier {
  static MovieDetailProvider state(BuildContext context, [listen = false]) =>
      Provider.of<MovieDetailProvider>(context, listen: listen);

  double _offset = 0.0;
  bool fadeOff = false;

  double get offset => this._offset;
  set offset(double newOffset) {
    this._offset = newOffset;
    notifyListeners();
  }

  void setFade(bool flag) {
    this.fadeOff = flag;
    notifyListeners();
  }
}
