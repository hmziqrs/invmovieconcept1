import 'package:flutter/material.dart';
import 'package:invmovieconcept1/screens/Home/widgets/Drawer/data.dart';
import 'package:invmovieconcept1/widgets/Screen/ScreenStateProvider.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/UI.dart';

import '../../Theme.dart';

import 'HomeDrawerVersion.dart';
import 'HomeDrawerAvatar.dart';
import 'HomeDrawerButton.dart';
import 'data.dart' as data;

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> with AnimationMixin {
  void buttonHandler(data.NavigationKey key) {
    Navigator.pop(context);
    switch (key) {
      case data.NavigationKey.developer:
        Navigator.pushNamed(context, "aboutDeveloper");
        break;
      case data.NavigationKey.designer:
        Navigator.pushNamed(context, "aboutDesigner");
        break;
      case data.NavigationKey.download:
        Navigator.pushNamed(context, "download");
        break;
      case data.NavigationKey.movies:
        Navigator.pushNamed(context, "myMovies");
        break;
      case data.NavigationKey.settings:
        ScreenStateProvider.state(context).setSettingsOpen(true);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HomeTheme.background,
      alignment: Alignment.topCenter,
      child: SafeArea(
        child: Container(
          height: UI.height,
          child: Material(
            color: Colors.transparent,
            child: ListView(
              children: [
                // Avatar Started
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: AppDimensions.maxContainerWidth,
                    child: HomeDrawerAvatar(
                      baseAnimation: 1.0,
                    ),
                  ),
                ),
                // Avatar Finished
                Container(
                  height: 1,
                  color: HomeTheme.text.withOpacity(0.4),
                ),
                SizedBox(height: AppDimensions.padding * 2),
                ...data.list
                    .asMap()
                    .entries
                    .map(
                      (entry) => Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: AppDimensions.maxContainerWidth,
                          child: HomeDrawerButton(
                            entry: entry,
                            baseAnimation: 1.0,
                            onPressed: () {
                              final _key = entry.value["key"] as NavigationKey;
                              this.buttonHandler(_key);
                            },
                          ),
                        ),
                      ),
                    )
                    .toList(),
                // Navigation List End
                // Version
                HomeDrawerVersion(
                  baseAnimation: 1.0,
                ),
                SizedBox(height: AppDimensions.padding * 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
