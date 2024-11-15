import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:supercharged/supercharged.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/App.dart';

import 'package:invmovieconcept1/Utils.dart';

import 'package:invmovieconcept1/widgets/BottomSheets/WithBoxButtons.dart';
import 'package:invmovieconcept1/widgets/SnackBars/Base.dart';
import 'package:invmovieconcept1/widgets/Buttons/Alpha.dart';

import 'messages/keys.dart';

class AboutUserContactButton extends StatelessWidget {
  AboutUserContactButton({
    this.url,
    required this.icon,
    required this.label,
    required this.platform,
    required this.initContext,
  });

  final String? url;
  final String label;
  final IconData icon;
  final String platform;
  final Function(BuildContext) initContext;

  void onTap(BuildContext context) {
    final socialUrl = this.url ?? Utils.socialLink(this.label, this.platform);
    final isMobile = Utils.isMobile();

    // Labels
    final label1 = App.translate(
      isMobile ? AboutUserWidgetMessages.share : AboutUserWidgetMessages.copy,
      context,
    );
    final label2 = App.translate(
      AboutUserWidgetMessages.open,
      context,
    );
    final linkCopied = App.translate(
      AboutUserWidgetMessages.linkCopied,
      context,
    );

    final or = App.translate(
      AboutUserWidgetMessages.or,
      context,
    );
    final developers = App.translate(
      AboutUserWidgetMessages.developers,
      context,
    );
    final profile = App.translate(
      AboutUserWidgetMessages.profile,
      context,
    );

    final icon1 = isMobile
        ? TeenyIcons.share : TeenyIcons.clipboard;
    final icon2 = this.icon;

    showBottomSheetWithBoxButtons(
      context: context,
      appinit: this.initContext,
      button1: (bottomSheetContext) async {
        if (isMobile) {
          Share.share(socialUrl, subject: this.platform);
        } else {
          Clipboard.setData(
            ClipboardData(
              text: socialUrl,
            ),
          );
          Navigator.pop(bottomSheetContext);
          await 200.milliseconds.delay;
          // Scaffold.of(context).hideCurrentSnackBar(
          //   reason: SnackBarClosedReason.dismiss,
          // );
          showSnackBarBase(
            context: context,
            text: "${this.platform} $linkCopied}",
          );
        }
      },
      button2: (_) => Utils.launchUrl(socialUrl),
      title: "$label2 $or $label1 $developers ${this.platform} $profile",
      label1: label1,
      label2: label2,
      icon1: icon1,
      icon2: icon2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlphaButton(
      icon: this.icon,
      label: this.label.toUpperCase(),
      onTap: () => this.onTap(context),
      margin: EdgeInsets.only(
        top: AppDimensions.padding * 2,
        left: AppDimensions.padding * 2,
        right: AppDimensions.padding * 2,
      ),
    );
  }
}
