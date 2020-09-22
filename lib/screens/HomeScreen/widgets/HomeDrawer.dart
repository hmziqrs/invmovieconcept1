import 'package:flutter/material.dart';
import 'package:invmovieconcept1/UI.dart';
import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';

import '../Dimensions.dart';
import '../provider.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeProvider>(context, listen: false);

    return Selector<HomeProvider, bool>(
      selector: (_, state) => state.isDrawerOpen,
      builder: (_, isDrawerOpen, __) {
        print("DRAWER $isDrawerOpen");

        return CustomAnimation(
          curve: Curves.easeInOut,
          control: isDrawerOpen
              ? CustomAnimationControl.PLAY
              : CustomAnimationControl.PLAY_REVERSE,
          tween: Tween(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 600),
          builder: (context, _, double value) {
            return Positioned(
              left: 0,
              top: ((value - 1) * UI.height).abs(),
              child: Opacity(
                opacity: (value * 1.2).clamp(0.0, 1.0),
                child: SingleChildScrollView(
                  child: Container(
                    width: UI.width,
                    height: UI.height,
                    color: Colors.white,
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: Dimensions.containerWidth,
                      height: UI.height,
                      child: Material(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: AppDimensions.padding,
                                horizontal: AppDimensions.padding * 2,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 3,
                                        color: Colors.black,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                      child: ClipOval(
                                        child: Image.asset(
                                          "assets/avatars/rick.jpg",
                                        ),
                                      ),
                                      radius: Dimensions.drawerAvatarWidth,
                                    ),
                                  ),
                                  Container(
                                    width: AppDimensions.padding * 2,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hamza Iqbal",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: AppDimensions.ratio * 6 + 8,
                                        ),
                                      ),
                                      Text(
                                        "hamza.iqdev@gmail.com",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: AppDimensions.ratio * 5 + 5,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Flexible(child: Container()),
                                  IconButton(
                                    iconSize: AppDimensions.ratio * 10,
                                    icon: Icon(
                                      Icons.close,
                                    ),
                                    onPressed: () => state.isDrawerOpen = false,
                                  ),
                                ],
                              ),
                            ),
                            // Avatar Finished
                            Container(height: AppDimensions.padding),
                            Container(
                              height: 1,
                              color: Colors.black.withOpacity(0.1),
                            ),
                          ],
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
