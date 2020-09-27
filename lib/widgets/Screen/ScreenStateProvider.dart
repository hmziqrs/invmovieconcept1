import 'package:flutter/material.dart';

import 'package:invmovieconcept1/UI.dart';

class ScreenStateProvider extends ChangeNotifier {
  bool _isSettingsOpen = false;

  double _baseOffset = UI.height - 20;

  bool get isSettingsOpen => this._isSettingsOpen;
  double get baseOffset => this._baseOffset;

  void onLayoutChange() {
    this._baseOffset = UI.height - 20;
  }

  set isSettingsOpen(bool flag) {
    this._isSettingsOpen = flag;
    notifyListeners();
  }
}
