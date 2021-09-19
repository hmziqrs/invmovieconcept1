import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supercharged/supercharged.dart';
import 'package:share/share.dart';

import 'package:invmovieconcept1/configs/App.dart';

import 'package:invmovieconcept1/Utils.dart';

import 'messages/keys.dart';

void openOrShare({
  BuildContext context,
  //
  String title,

  // SecondButton
  String actionLink,
  String actionLabel,

  // snackLabel
  String action2Link,
  String snackLabel,
  String shareLabel,
}) {
  final style = ButtonStyle(
    overlayColor: MaterialStateColor.resolveWith(
      (states) => Theme.of(context).primaryColor.withOpacity(0.05),
    ),
  );

  final textStyle = TextStyle(
    color: Theme.of(context).primaryColor,
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          App.translate(title, context),
        ),
        actions: [
          TextButton(
            style: style,
            onPressed: () => Navigator.pop(context),
            child: Text(
              App.translate(AlertWidgetMessages.close),
              style: textStyle,
            ),
          ),
          TextButton(
            style: style,
            onPressed: () => Utils.launchUrl(actionLink),
            child: Text(App.translate(actionLabel), style: textStyle),
          ),
          TextButton(
            style: style,
            onPressed: () async {
              if (Utils.isMobile()) {
                Share.share(
                  action2Link,
                  subject: shareLabel,
                );

                Navigator.pop(context);
              } else if (Utils.isDesktop()) {
                bool hasSnackbar = snackLabel != null;
                await Clipboard.setData(ClipboardData(text: action2Link));
                Navigator.pop(context);
                if (hasSnackbar) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text(snackLabel),
                    ),
                  );
                  await 1600.milliseconds.delay;
                  Scaffold.of(context).hideCurrentSnackBar();
                }
              }
            },
            child: Text(
              App.translate(
                Utils.isMobile()
                    ? AlertWidgetMessages.share
                    : AlertWidgetMessages.copy,
              ),
              style: textStyle,
            ),
          ),
        ],
      );
    },
  );
}
