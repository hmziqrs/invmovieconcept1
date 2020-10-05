import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share/share.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/App.dart';

import 'package:invmovieconcept1/Utils.dart';

import 'package:invmovieconcept1/widgets/BottomSheets/Base.dart';
import 'package:invmovieconcept1/widgets/Banners/Alpha.dart';
import 'package:invmovieconcept1/widgets/Buttons/Alpha.dart';
import 'package:invmovieconcept1/widgets/Buttons/Boxed.dart';
import 'package:invmovieconcept1/widgets/Header/Header.dart';

import 'DownloadHeading.dart';

import '../messages/keys.dart';
import '../data.dart' as data;
import '../Dimensions.dart';

class DownloadBody extends StatelessWidget {
  void onTap(BuildContext context, Map map) {
    final str = ["web", "github", "play store"].where(
      (element) => element == map["name"].toString().toLowerCase(),
    );

    final makeOpen = str.length == 1;
    final isMobile = Utils.isMobile();
    final label1 = App.translate(
      isMobile ? DownloadScreenMessages.share : DownloadScreenMessages.copy,
      context,
    );
    final label2 = App.translate(
      makeOpen ? DownloadScreenMessages.open : DownloadScreenMessages.download,
      context,
    );

    Scaffold.of(context).showBottomSheet(
      (context) {
        Dimensions.init(context);
        return BottomSheetBase(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: AppDimensions.padding * 1,
                horizontal: AppDimensions.padding * 2,
              ),
              child: Text(
                "$label2 or $label1 ${map["name"]} url",
                style: TextStyles.heading56,
              ),
            ),
            Row(
              children: [
                BoxedButton(
                  label: label1.toUpperCase(),
                  onPressed: () {
                    if (isMobile) {
                      Share.share(map["url"], subject: map["name"]);
                    } else {
                      Clipboard.setData(
                        ClipboardData(
                          text: map["url"].toString(),
                        ),
                      );
                    }
                  },
                  icon: isMobile
                      ? MaterialCommunityIcons.share_variant
                      : MaterialCommunityIcons.content_copy,
                ),
                BoxedButton(
                  label: (label2).toUpperCase(),
                  onPressed: () => Utils.launchUrl(map["url"]),
                  icon: makeOpen
                      ? MaterialCommunityIcons.web
                      : MaterialCommunityIcons.download,
                ),
              ],
            ),
          ],
        );
      },
      backgroundColor: Colors.transparent,
    );
  }

  Widget mapButton(context, Map obj) {
    final buttonMargin = EdgeInsets.only(
      top: AppDimensions.padding * 2,
      left: AppDimensions.padding * 2,
      right: AppDimensions.padding * 2,
    );

    return AlphaButton(
      onTap: () => this.onTap(context, obj),
      icon: obj["icon"],
      margin: buttonMargin,
      label: obj["name"].toString().toUpperCase(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Header(label: App.translate(DownloadScreenMessages.title)),
        // Content

        AlphaBanner(text: App.translate(DownloadScreenMessages.desc)),
        SizedBox(height: AppDimensions.padding * 2),

        //Mobile
        DownloadHeading(label: DownloadScreenMessages.mobile),
        ...data.mobileLinks.map((obj) => this.mapButton(context, obj)).toList(),
        SizedBox(height: AppDimensions.padding * 2),

        // Desktop
        DownloadHeading(label: DownloadScreenMessages.desktop),
        ...data.desktopLinks
            .map((obj) => this.mapButton(context, obj))
            .toList(),
        SizedBox(height: AppDimensions.padding * 2),

        // Web
        DownloadHeading(label: DownloadScreenMessages.web),
        ...data.webLinks.map((obj) => this.mapButton(context, obj)).toList(),
        SizedBox(height: AppDimensions.padding * 2),
      ],
    );
  }
}
