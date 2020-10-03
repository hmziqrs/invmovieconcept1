import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/Theme.dart' as theme;
import 'package:invmovieconcept1/Utils.dart';

import 'package:invmovieconcept1/widgets/Screen/Screen.dart';

import 'widgets/DownloadLink.dart';

import 'data.dart' as data;
import 'Dimensions.dart';

class DownloadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    final textColor = Theme.of(context).textTheme.bodyText1.color;

    return Screen(
      belowBuilder: (context) => CustomAnimation<Color>(
        tween: ColorTween(
          begin: theme.primary.withOpacity(0.15),
          end: theme.primary.withOpacity(1.0),
        ),
        duration: Duration(milliseconds: 2400),
        control: CustomAnimationControl.MIRROR,
        builder: (context, child, animation) {
          return Positioned(
            bottom: AppDimensions.ratio * -10,
            right: AppDimensions.ratio * 5,
            child: Icon(
              MaterialCommunityIcons.cloud_download_outline,
              size: AppDimensions.ratio * 100,
              color: animation,
            ),
          );
        },
      ),
      child: Align(
        child: Container(
          width: AppDimensions.containerWidth,
          child: ListView(
            children: <Widget>[
              Utils.safePadding(context, "top"),
              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(MaterialCommunityIcons.chevron_left),
                    ),
                    Container(
                      // color: Colors.red,
                      padding: EdgeInsets.all(AppDimensions.padding * 2),
                      child: Text(
                        "Download",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14 + AppDimensions.ratio * 4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: textColor.withOpacity(0.65),
                padding: EdgeInsets.only(
                  left: AppDimensions.padding * 2,
                  right: AppDimensions.padding * 2,
                  top: AppDimensions.padding * 1,
                  bottom: AppDimensions.padding * 1.5,
                ),
                child: Text(
                  "Explore app on a different platform or share the link directly with anyone who may be interested in exploring the app",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 10 + AppDimensions.ratio * 3,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.padding * 2),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 2,
                ),
                child: Text(
                  "Mobile",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14 + AppDimensions.ratio * 4,
                  ),
                ),
              ),
              ...data.mobileLinks
                  .map(
                    (e) => DownloadLink(
                      icon: e["icon"],
                      label: e["name"],
                      link: e["url"],
                    ),
                  )
                  .toList(),
              SizedBox(height: AppDimensions.padding * 2),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 2,
                ),
                child: Text(
                  "Desktop",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14 + AppDimensions.ratio * 4,
                  ),
                ),
              ),
              ...data.desktopLinks
                  .map(
                    (e) => DownloadLink(
                      icon: e["icon"],
                      label: e["name"],
                      link: e["url"],
                    ),
                  )
                  .toList(),
              SizedBox(height: AppDimensions.padding * 2),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 2,
                ),
                child: Text(
                  "Web",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14 + AppDimensions.ratio * 4,
                  ),
                ),
              ),
              ...data.webLinks
                  .map(
                    (e) => DownloadLink(
                      icon: e["icon"],
                      label: e["name"],
                      link: e["url"],
                    ),
                  )
                  .toList(),
              SizedBox(height: AppDimensions.padding * 2),
            ],
          ),
        ),
      ),
    );
  }
}
