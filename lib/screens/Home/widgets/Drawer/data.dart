import '../../messages/keys.dart';

enum NavigationKey {
  home,
  movies,
  developer,
  designer,
  download,
  settings,
}

final list = [
  {
    "label": HomeScreenMessages.drawerHome,
    "key": NavigationKey.home,
  },
  {
    "label": HomeScreenMessages.drawerMovies,
    "key": NavigationKey.movies,
  },
  {
    "label": HomeScreenMessages.drawerDeveloper,
    "key": NavigationKey.developer,
  },
  {
    "label": HomeScreenMessages.drawerDesigner,
    "key": NavigationKey.designer,
  },
  {
    "label": HomeScreenMessages.drawerDownload,
    "key": NavigationKey.download,
  },
  {
    "label": HomeScreenMessages.drawerSettings,
    "key": NavigationKey.settings,
  },
];
