import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supercharged/supercharged.dart';
import 'package:share/share.dart';

import 'package:invmovieconcept1/configs/Theme.dart' as theme;
import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/Utils.dart';

class DownloadLink extends StatelessWidget {
  DownloadLink({
    @required this.icon,
    @required this.label,
    @required this.link,
  });

  final IconData icon;
  final String label;
  final String link;

  void onTap(BuildContext context) {
    final style = ButtonStyle(
      overlayColor: MaterialStateColor.resolveWith(
        (states) => Theme.of(context).primaryColor.withOpacity(0.05),
      ),
    );
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text("Choose Action"),
        content: Container(
          child: Text("Do you wanna donwload or share it"),
        ),
        actions: [
          TextButton(
            style: style,
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Close",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          TextButton(
            style: style,
            onPressed: () => Utils.launchUrl(this.link),
            child: Text(
              "Download",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          TextButton(
            style: style,
            onPressed: () async {
              if (Utils.isMobile()) {
                Share.share(
                  this.link,
                  subject: this.label,
                );
                Navigator.pop(context);
              } else if (Utils.isDesktop()) {
                await Clipboard.setData(ClipboardData(text: this.link));
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${this.label} link copied"),
                  ),
                );
                Navigator.pop(context);
                await 1600.milliseconds.delay;
                Scaffold.of(context).hideCurrentSnackBar();
              }
            },
            child: Text(
              Utils.isMobile() ? "Share" : "Copy",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyText1.color;

    return Padding(
      padding: EdgeInsets.only(
        top: AppDimensions.padding * 2,
        left: AppDimensions.padding * 2,
        right: AppDimensions.padding * 2,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => this.onTap(context),
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: textColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.symmetric(
              vertical: AppDimensions.padding * 2,
              horizontal: AppDimensions.padding * 3,
            ),
            child: Row(
              children: [
                Icon(
                  this.icon,
                  size: 10 + AppDimensions.ratio * 4,
                ),
                SizedBox(width: AppDimensions.padding * 2),
                Text(
                  this.label.toUpperCase(),
                  style: TextStyle(
                    fontSize: 8 + AppDimensions.ratio * 3,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
