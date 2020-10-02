import 'package:flutter/material.dart';
import 'package:invmovieconcept1/widgets/Screen/ScreenStateProvider.dart';
import 'package:provider/provider.dart';
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
    switch (key) {
      case data.NavigationKey.home:
        Navigator.pop(context);
        break;
      case data.NavigationKey.settings:
        Navigator.pop(context);
        Provider.of<ScreenStateProvider>(context, listen: false)
            .isSettingsOpen = true;
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
          width: AppDimensions.containerWidth,
          height: UI.height,
          child: Material(
            color: Colors.transparent,
            child: ListView(
              children: [
                // Avatar Started
                HomeDrawerAvatar(
                  baseAnimation: 1.0,
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
                      (entry) => HomeDrawerButton(
                        entry: entry,
                        onPressed: () => this.buttonHandler(entry.value["key"]),
                        baseAnimation: 1.0,
                      ),
                    )
                    .toList(),
                // Navigavtion List End
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
