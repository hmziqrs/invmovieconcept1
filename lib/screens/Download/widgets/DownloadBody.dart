import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:supercharged/supercharged.dart';

import 'package:invmovieconcept1/Utils.dart';
import 'package:invmovieconcept1/configs/App.dart';
import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/widgets/Banners/Alpha.dart';
import 'package:invmovieconcept1/widgets/BottomSheets/WithBoxButtons.dart';
import 'package:invmovieconcept1/widgets/Buttons/Alpha.dart';
import 'package:invmovieconcept1/widgets/Header/Header.dart';
import 'package:invmovieconcept1/widgets/SnackBars/snackbars.dart' as snackBars;

import '../Dimensions.dart';
import '../data.dart' as data;
import '../messages/keys.dart';
import 'DownloadHeading.dart';

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

    final icon1 = isMobile
        ? TeenyIcons.share : IonIcons.copy;
    final icon2 =
        makeOpen ? TeenyIcons.globe : IonIcons.download;

    showBottomSheetWithBoxButtons(
      context: context,
      appinit: Dimensions.init,
      button1: (bottomSheetContext) async {
        if (isMobile) {
          Share.share(map["url"], subject: map["name"]);
        } else {
          Clipboard.setData(
            ClipboardData(
              text: map["url"].toString(),
            ),
          );
          Navigator.pop(bottomSheetContext);
          await 200.milliseconds.delay;
          // Scaffold.of(context).hideCurrentSnackBar(
          //   reason: SnackBarClosedReason.dismiss,
          // );
          snackBars.showSnackBarBase(
            context: context,
            text:
                "${map["name"]} ${App.translate(DownloadScreenMessages.linkCopied, context)}",
          );
        }
      },
      button2: (_) => Utils.launchUrl(map["url"]),
      title: "$label2 or $label1 ${map["name"]} url",
      label1: label1,
      label2: label2,
      icon1: icon1,
      icon2: icon2,
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
        Header(
          label: App.translate(DownloadScreenMessages.title),
          onBack: () => Navigator.popUntil(
            context,
            ModalRoute.withName("home"),
          ),
        ),
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
