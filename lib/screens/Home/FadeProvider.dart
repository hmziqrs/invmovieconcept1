import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:provider/provider.dart';

class HomeFadeProvider extends ChangeNotifier {
  static HomeFadeProvider state(BuildContext context, [listen = false]) =>
      Provider.of<HomeFadeProvider>(context, listen: listen);
  static Duration microDuration = 280.milliseconds;

  bool fadeOff = false;

  void setFade(bool flag) {
    this.fadeOff = flag;
    notifyListeners();
  }
}
