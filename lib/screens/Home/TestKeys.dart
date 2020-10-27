const String scope = "HomeScreen";

abstract class HomeTestKeys {
  static final String drawerButton = "$scope/drawerButton";
  static final String drawerCloseButton = "$scope/drawerCloseButton";

  static final String searchButton = "$scope/searchButton";

  static final String movieCardsBase = "$scope/movieCardsBase";

  static getCard(int index) {
    return "$scope/movieCard$index";
  }
}
