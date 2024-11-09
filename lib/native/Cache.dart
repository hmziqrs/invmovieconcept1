import 'package:shared_preferences/shared_preferences.dart';

abstract class Cache {
  static late SharedPreferences ins;

  static init() async {
    ins = await SharedPreferences.getInstance();
  }
}
