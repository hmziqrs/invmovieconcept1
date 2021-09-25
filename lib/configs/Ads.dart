import 'package:universal_io/io.dart';

abstract class Ads {
  static String getAppId() {
    return "ca-app-pub-9217632370383904~2821189635";
  }

  static String getTestBannerId() {
    if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/2934735716";
    }
    return "ca-app-pub-3940256099942544/6300978111";
  }

  static String getBannerId() {
    return "ca-app-pub-9217632370383904/6416642104";
  }
}
