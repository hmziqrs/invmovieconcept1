import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:invmovieconcept1/widgets/Snackbars/Base.dart';
import 'package:supercharged/supercharged.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';

import 'package:invmovieconcept1/Utils.dart';
import 'package:invmovieconcept1/widgets/BottomSheets/WithBoxButtons.dart';

import 'package:invmovieconcept1/widgets/Buttons/Alpha.dart';
import 'package:invmovieconcept1/widgets/Header/Header.dart';
import 'package:invmovieconcept1/widgets/Banners/Alpha.dart';
import 'package:invmovieconcept1/widgets/Screen/Screen.dart';
import 'package:share/share.dart';

import 'widgets/AboutDeveloperMoreProjects.dart';
import 'widgets/AboutDeveloperMySkills.dart';

import 'data.dart' as data;
import 'Dimensions.dart';

class AboutDeveloperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return Screen(
      child: AboutDeveloperChild(),
    );
  }
}

class AboutDeveloperChild extends StatelessWidget {
  void onTap(BuildContext context, Map map) {
    final url = map["url"] ?? Utils.socialLink(map["label"], map["platform"]);

    print(map);

    final isMobile = Utils.isMobile();
    final label1 = isMobile ? "Share" : "Copy";
    final label2 = "Open";

    final icon1 = isMobile
        ? MaterialCommunityIcons.share_variant
        : MaterialCommunityIcons.content_copy;
    final icon2 = map["icon"];

    showBottomSheetWithBoxButtons(
      context: context,
      appinit: Dimensions.init,
      button1: (bottomSheetContext) async {
        if (isMobile) {
          Share.share(url, subject: map["platform"]);
        } else {
          Clipboard.setData(
            ClipboardData(
              text: url.toString(),
            ),
          );
          Navigator.pop(bottomSheetContext);
          await 200.milliseconds.delay;
          Scaffold.of(context).hideCurrentSnackBar(
            reason: SnackBarClosedReason.dismiss,
          );
          showSnackBarBase(
            context: context,
            text: "${map["platform"]} link copied",
          );
        }
      },
      button2: (_) => Utils.launchUrl(url),
      title: "$label2 or $label1 developer's ${map["platform"]} profile",
      label1: label1,
      label2: label2,
      icon1: icon1,
      icon2: icon2,
    );
  }

  Widget mapButton(Map obj, VoidCallback onTap) {
    final buttonMargin = EdgeInsets.only(
      top: AppDimensions.padding * 2,
      left: AppDimensions.padding * 2,
      right: AppDimensions.padding * 2,
    );

    return AlphaButton(
      onTap: onTap,
      icon: obj["icon"],
      margin: buttonMargin,
      label: obj["label"].toString().toUpperCase(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: AppDimensions.containerWidth,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Header(label: "About Developer"),
            SizedBox(height: AppDimensions.padding * 1),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 2,
              ),
              child: Text(
                "Hamza Iqbal",
                style: TextStyles.heading16,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 2,
              ),
              child: Text(
                "Full Stack, React Native & Flutter Developer",
                style: TextStyles.body16.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: data.descs
                  .map(
                    (text) => Padding(
                      padding: EdgeInsets.only(
                        left: AppDimensions.padding * 2,
                        right: AppDimensions.padding * 2,
                        top: AppDimensions.padding * 0.8,
                      ),
                      child: Text(
                        text,
                        style: TextStyles.body16.copyWith(
                          color: AppTheme.subText,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: AppDimensions.padding * 3),
            Container(height: 1, color: AppTheme.subText3.withOpacity(0.1)),
            SizedBox(height: AppDimensions.padding * 2),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 2,
              ),
              child: Text(
                "My Skill Set",
                style: TextStyles.heading4,
              ),
            ),
            SizedBox(height: AppDimensions.padding * 1),
            AboutDeveloperMySkills(),
            SizedBox(height: AppDimensions.padding * 2),
            Container(height: 1, color: AppTheme.subText3.withOpacity(0.1)),
            SizedBox(height: AppDimensions.padding * 2),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 2,
              ),
              child: Text(
                "My Contacts",
                style: TextStyles.heading4,
              ),
            ),
            SizedBox(height: AppDimensions.padding * 2),
            AlphaBanner(
              text:
                  "I've shared my contacts strictly for buissness related queries ONLY.\nFor any Flutter related help post your query on Flutter Github, Flutter sub reddit & Flutter facebook groups",
            ),
            SizedBox(height: AppDimensions.padding * 1),
            ...data.contacts
                .map(
                  (obj) => this.mapButton(
                    obj,
                    () => this.onTap(context, obj),
                  ),
                )
                .toList(),
            SizedBox(height: AppDimensions.padding * 3),
            Container(height: 1, color: AppTheme.subText3.withOpacity(0.1)),
            SizedBox(height: AppDimensions.padding * 2),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 2,
              ),
              child: Text(
                "Like the project ?",
                style: TextStyles.heading4,
              ),
            ),
            SizedBox(height: AppDimensions.padding * 2),
            AlphaBanner(
              text: "Show support by performing any action listed below.",
            ),
            SizedBox(height: AppDimensions.padding * 1),
            ...data.showSupport
                .map(
                  (obj) => this.mapButton(
                    obj,
                    () => Utils.launchUrl(obj["link"]),
                  ),
                )
                .toList(),
            SizedBox(height: AppDimensions.padding * 3),
            Container(height: 1, color: AppTheme.subText3.withOpacity(0.1)),
            SizedBox(height: AppDimensions.padding * 2),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppDimensions.padding * 2,
              ),
              child: Text(
                "More Amazing Projects",
                style: TextStyles.heading4,
              ),
            ),
            SizedBox(height: AppDimensions.padding * 1),
            AboutDeveloperMoreProjects(),
            SizedBox(height: AppDimensions.padding * 3),
          ],
        ),
      ),
    );
  }
}
