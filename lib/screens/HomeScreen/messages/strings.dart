import 'dart:isolate';

const String scope = 'HomeScreen';

const Map strings = {
  // Tabs
  '$scope/tabInTheater': 'In Theater',
  '$scope/tabBoxOffice': 'Box Office',
  '$scope/tabTop10': 'Top 10',
  '$scope/tabTrending': 'Trending',
  // Drawer
  '$scope/drawerHome': "Explore movies",
  '$scope/drawerMovies': "My Movies",
  '$scope/drawerDeveloper': "About Developer",
  '$scope/drawerDesigner': "About Designer",
  '$scope/drawerDownload': "Download",
  '$scope/drawerSettings': "App Settings",
  //Version
  '$scope/version': "VERSION",
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
