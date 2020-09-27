import 'package:flutter/material.dart';
import 'package:invmovieconcept1/widgets/Screen/ScreenStateProvider.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/UI.dart';

import '../../provider.dart';
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
  double gestureOffset = 0.0;
  Animation<double> animation;

  @override
  void initState() {
    this.animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      this.controller,
    );

    this.controller.duration = Duration(milliseconds: 600);

    this.controller.addListener(() {
      setState(() {
        this.gestureOffset = this.animation.value;
      });
    });

    super.initState();
  }

  void onVerticalDragUpdate(DragUpdateDetails details) {
    if (this.animation.value != 1.0) {
      return;
    }

    setState(() {
      this.gestureOffset =
          (this.gestureOffset - (details.delta.dy / UI.height)).clamp(0.2, 1.0);
    });
  }

  void onVerticalDragEnd(DragEndDetails details) {
    if (this.animation.value != 1.0) {
      return;
    }

    final state = Provider.of<HomeProvider>(context, listen: false);

    if (this.gestureOffset < 0.80) {
      state.isDrawerOpen = false;
      this.controller.reverse(from: this.gestureOffset);
    } else {
      this.controller.forward(from: this.gestureOffset);
    }
  }

  void buttonHandler(data.NavigationKey key) {
    switch (key) {
      case data.NavigationKey.settings:
        Provider.of<ScreenStateProvider>(context, listen: false)
            .isSettingsOpen = true;
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeProvider>(context, listen: false);

    return Selector<HomeProvider, bool>(
      selector: (_, state) => state.isDrawerOpen,
      builder: (_, isDrawerOpen, __) {
        if (isDrawerOpen && this.animation.value == 0.0) {
          this.controller.play();
        }
        return Selector<ScreenStateProvider, bool>(
          selector: (_, state) => state.isSettingsOpen,
          builder: (_, isSettingsOpen, __) {
            return WillPopScope(
              onWillPop: () async {
                if (isSettingsOpen) {
                  return true;
                }
                if (isDrawerOpen) {
                  this.controller.reverse(from: this.gestureOffset);
                  state.isDrawerOpen = false;
                }
                return !isDrawerOpen;
              },
              child: Positioned(
                left: 0,
                top: ((this.gestureOffset - 1) * UI.height).abs(),
                child: Opacity(
                  opacity: (this.animation.value * 1.2).clamp(0.0, 1.0),
                  child: GestureDetector(
                    onVerticalDragUpdate: this.onVerticalDragUpdate,
                    onVerticalDragEnd: this.onVerticalDragEnd,
                    child: Container(
                      child: SingleChildScrollView(
                        child: Container(
                          width: UI.width,
                          height: UI.height,
                          color: HomeTheme.background,
                          alignment: Alignment.topCenter,
                          child: SafeArea(
                            child: Container(
                              width: AppDimensions.containerWidth,
                              height: UI.height,
                              child: Material(
                                color: Colors.transparent,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Avatar Started
                                    HomeDrawerAvatar(
                                      baseAnimation: this.animation.value,
                                      onClose: () => this.controller.reverse(),
                                    ),
                                    // Avatar Finished
                                    Container(
                                      height: 1,
                                      color: HomeTheme.text.withOpacity(0.4),
                                    ),
                                    Container(
                                        height: AppDimensions.padding * 1.5),
                                    ...data.list
                                        .asMap()
                                        .entries
                                        .map(
                                          (entry) => HomeDrawerButton(
                                            entry: entry,
                                            onPressed: () => this.buttonHandler(
                                                entry.value["key"]),
                                            baseAnimation: this.animation.value,
                                          ),
                                        )
                                        .toList(),
                                    // Navigavtion List End
                                    // Version
                                    HomeDrawerVersion(
                                      baseAnimation: this.animation.value,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
