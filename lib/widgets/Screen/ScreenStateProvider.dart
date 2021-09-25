import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenStateProvider extends ChangeNotifier {
  static ScreenStateProvider state(BuildContext context, [listen = false]) =>
      Provider.of<ScreenStateProvider>(context, listen: listen);

  bool _isSettingsOpen = false;
  bool get isSettingsOpen => this._isSettingsOpen;

  setSettingsOpen(bool flag) {
    if (flag == this._isSettingsOpen) {
      return;
    }
    this._isSettingsOpen = flag;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => this._isLoading;

  setLoading(bool flag) {
    if (flag == this._isLoading) {
      return;
    }
    this._isLoading = flag;
    notifyListeners();
  }
}
