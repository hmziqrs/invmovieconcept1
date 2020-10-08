import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:supercharged/supercharged.dart';
import 'package:share/share.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/App.dart';

import 'package:invmovieconcept1/Utils.dart';

import 'package:invmovieconcept1/widgets/BottomSheets/WithBoxButtons.dart';
import 'package:invmovieconcept1/widgets/SnackBars/Base.dart';
import 'package:invmovieconcept1/widgets/Buttons/Alpha.dart';
import 'package:invmovieconcept1/widgets/Header/Header.dart';
import 'package:invmovieconcept1/widgets/Banners/Alpha.dart';

import 'AboutDeveloperMoreProjects.dart';
import 'AboutDeveloperMySkills.dart';
import 'AboutDeveloperHeading.dart';

import '../messages/keys.dart';
import '../data.dart' as data;
import '../Dimensions.dart';

class AboutDeveloperChild extends StatelessWidget {
  void onTap(BuildContext context, Map map) {
    final url = map["url"] ?? Utils.socialLink(map["label"], map["platform"]);

    print(map);

    final isMobile = Utils.isMobile();
    final label1 = App.translate(isMobile
        ? AboutDeveloperScreenMessages.share
        : AboutDeveloperScreenMessages.copy);
    final label2 = App.translate(AboutDeveloperScreenMessages.open);

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
            text:
                "${map["platform"]} ${App.translate(AboutDeveloperScreenMessages.linkCopied)}",
          );
        }
      },
      button2: (_) => Utils.launchUrl(url),
      title:
          "$label2 ${App.translate(AboutDeveloperScreenMessages.or)} $label1 ${App.translate(AboutDeveloperScreenMessages.developers)} ${map["platform"]} ${App.translate(AboutDeveloperScreenMessages.profile)}",
      label1: label1,
      label2: label2,
      icon1: icon1,
      icon2: icon2,
    );
  }

  Widget mapButton(
    Map obj,
    VoidCallback onTap, {
    String prefix,
    BuildContext context,
  }) {
    final buttonMargin = EdgeInsets.only(
      top: AppDimensions.padding * 2,
      left: AppDimensions.padding * 2,
      right: AppDimensions.padding * 2,
    );

    String label = obj["label"].toString();

    if (prefix != null) {
      label = App.translate(label) + " " + prefix;
    }

    return AlphaButton(
      onTap: onTap,
      label: label.toUpperCase(),
      icon: obj["icon"],
      margin: buttonMargin,
    );
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    return Align(
      child: Container(
        width: AppDimensions.containerWidth,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Header(
              label: App.translate(
                AboutDeveloperScreenMessages.title,
                context,
              ),
            ),
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
                style: TextStyles.body17.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: data.devDescription
                  .map(
                    (text) => Padding(
                      padding: EdgeInsets.only(
                        left: AppDimensions.padding * 2,
                        right: AppDimensions.padding * 2,
                        top: AppDimensions.padding * 0.8,
                      ),
                      child: Text(
                        App.translate(text, context),
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
            AboutDeveloperHeading(
              label: AboutDeveloperScreenMessages.skillSet,
            ),
            SizedBox(height: AppDimensions.padding * 1),
            AboutDeveloperMySkills(),
            SizedBox(height: AppDimensions.padding * 2),
            Container(height: 1, color: AppTheme.subText3.withOpacity(0.1)),
            SizedBox(height: AppDimensions.padding * 2),
            AboutDeveloperHeading(
              label: AboutDeveloperScreenMessages.contacts,
            ),
            SizedBox(height: AppDimensions.padding * 2),
            AlphaBanner(
              text: App.translate(
                AboutDeveloperScreenMessages.contactsDesc,
                context,
              ),
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
            AboutDeveloperHeading(
              label: AboutDeveloperScreenMessages.likeProject,
            ),
            SizedBox(height: AppDimensions.padding * 2),
            AlphaBanner(
              text: App.translate(
                AboutDeveloperScreenMessages.likeProjectDesc,
                context,
              ),
            ),
            SizedBox(height: AppDimensions.padding * 1),
            ...data.showSupport
                .map(
                  (obj) => this.mapButton(
                    obj,
                    () => Utils.launchUrl(obj["link"]),
                    prefix: obj["platform"] ?? "",
                  ),
                )
                .toList(),
            SizedBox(height: AppDimensions.padding * 3),
            Container(height: 1, color: AppTheme.subText3.withOpacity(0.1)),
            SizedBox(height: AppDimensions.padding * 2),
            AboutDeveloperHeading(
              label: AboutDeveloperScreenMessages.moreProjects,
            ),
            SizedBox(height: AppDimensions.padding * 1),
            AboutDeveloperMoreProjects(),
          ],
        ),
      ),
    );
  }
}
