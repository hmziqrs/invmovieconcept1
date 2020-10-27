const String scope = "SelectSeatsScreen";

abstract class SelectSeatsTestKeys {
  static final String buyNow = "$scope/buyNow";

  static String getDay(int index) {
    return "$scope/selectSeatsDay$index";
  }

  static String getTime(int index) {
    return "$scope/selectSeatsTime$index";
  }

  static String getSeat(
    int x,
    int y,
  ) {
    return "$scope/selectSeats$x-$y";
  }
}
