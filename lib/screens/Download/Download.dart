import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:invmovieconcept1/UI.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/widgets/BottomSheets/Base.dart';
import 'package:invmovieconcept1/widgets/Buttons/Boxed.dart';
import 'package:simple_animations/simple_animations.dart';

import 'package:invmovieconcept1/configs/Theme.dart' as theme;
import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/App.dart';

import 'package:invmovieconcept1/widgets/Banners/Alpha.dart';
import 'package:invmovieconcept1/widgets/Buttons/Alpha.dart';
import 'package:invmovieconcept1/widgets/Header/Header.dart';
import 'package:invmovieconcept1/widgets/Screen/Screen.dart';

import 'messages/keys.dart';
import 'data.dart' as data;
import 'Dimensions.dart';

class DownloadScreen extends StatelessWidget {
  Widget belowBuilder(context) {
    return CustomAnimation<Color>(
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
    );
  }

  Widget mapButton(Map obj) {
    final buttonMargin = EdgeInsets.only(
      top: AppDimensions.padding * 2,
      left: AppDimensions.padding * 2,
      right: AppDimensions.padding * 2,
    );

    return Builder(builder: (context) {
      return AlphaButton(
        onTap: () {
          Scaffold.of(context).showBottomSheet(
            (context) {
              Dimensions.init(context);
              return BottomSheetBase(
                children: [
                  Row(
                    children: [
                      BoxedButton(
                        label: "Share",
                        onPressed: () {},
                        icon: MaterialCommunityIcons.share_variant,
                      ),
                      BoxedButton(
                        label: "Share",
                        onPressed: () {},
                        icon: MaterialCommunityIcons.share_variant,
                      ),
                    ],
                  ),
                ],
              );
            },
            backgroundColor: Colors.transparent,
          );
        },
        icon: obj["icon"],
        margin: buttonMargin,
        label: obj["name"].toString().toUpperCase(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return Screen(
      belowBuilder: this.belowBuilder,
      child: Align(
        child: Container(
          width: AppDimensions.containerWidth,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Header(label: App.translate(DownloadScreenMessages.title)),
              AlphaBanner(text: App.translate(DownloadScreenMessages.desc)),
              SizedBox(height: AppDimensions.padding * 2),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 2,
                ),
                child: Text(
                  App.translate(DownloadScreenMessages.mobile),
                  style: TextStyles.heading46,
                ),
              ),
              ...data.mobileLinks.map(this.mapButton).toList(),
              SizedBox(height: AppDimensions.padding * 2),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 2,
                ),
                child: Text(
                  App.translate(DownloadScreenMessages.desktop),
                  style: TextStyles.heading46,
                ),
              ),
              ...data.desktopLinks.map(this.mapButton).toList(),
              SizedBox(height: AppDimensions.padding * 2),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 2,
                ),
                child: Text(
                  App.translate(DownloadScreenMessages.web),
                  style: TextStyles.heading46,
                ),
              ),
              ...data.webLinks.map(this.mapButton).toList(),
              SizedBox(height: AppDimensions.padding * 2),
            ],
          ),
        ),
      ),
    );
  }
}
