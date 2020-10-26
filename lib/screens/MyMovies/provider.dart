import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyMoviesProvider extends ChangeNotifier {
  static MyMoviesProvider state(BuildContext context, [listen = false]) =>
      Provider.of<MyMoviesProvider>(context, listen: listen);

  bool fadeOff = false;

  void setFade(bool flag) {
    this.fadeOff = flag;
    notifyListeners();
  }
}
