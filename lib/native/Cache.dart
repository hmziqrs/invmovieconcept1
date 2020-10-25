import 'package:shared_preferences/shared_preferences.dart';

abstract class Cache {
  static SharedPreferences ins;

  static init() async {
    ins = await SharedPreferences.getInstance();
  }
}
