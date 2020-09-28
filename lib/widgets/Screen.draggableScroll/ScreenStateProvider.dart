import 'package:flutter/material.dart';

class ScreenStateProvider extends ChangeNotifier {
  bool _isSettingsOpen = false;

  double _opacity = 0.0;

  bool get isSettingsOpen => this._isSettingsOpen;
  double get opacity => this._opacity;

  set opacity(double newOapcity) {
    this._opacity = newOapcity;
    notifyListeners();
  }

  set isSettingsOpen(bool flag) {
    this._isSettingsOpen = flag;
    notifyListeners();
  }
}
