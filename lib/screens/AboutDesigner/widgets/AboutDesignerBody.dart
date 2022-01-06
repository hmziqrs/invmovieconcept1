import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/App.dart';

import 'package:invmovieconcept1/widgets/AboutUser/AboutUserContactButton.dart';
import 'package:invmovieconcept1/widgets/AboutUser/AboutUserHeading.dart';
import 'package:invmovieconcept1/widgets/AboutUser/AboutUserJobTitle.dart';
import 'package:invmovieconcept1/widgets/AboutUser/AboutUserSkills.dart';
import 'package:invmovieconcept1/widgets/AboutUser/AboutUserName.dart';
import 'package:invmovieconcept1/widgets/AboutUser/AboutUserBio.dart';

import 'package:invmovieconcept1/widgets/Banners/Alpha.dart';
import 'package:invmovieconcept1/widgets/Header/Header.dart';

import '../messages/keys.dart';
import '../data.dart' as data;
import '../Dimensions.dart';

class AboutDesignerBody extends StatelessWidget {
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
              label: AboutDesignerScreenMessages.title,
              onBack: () => Navigator.popUntil(
                context,
                ModalRoute.withName("home"),
              ),
            ),
            SizedBox(height: AppDimensions.padding * 1),
            AboutUserName(name: "Aneesh Raveendran"),
            AboutUserJobTitle(
              label: "Sr. User Interface Designer, Interaction designer",
            ),
            AboutUserBio(
              points: data.devDescription,
            ),
            SizedBox(height: AppDimensions.padding * 3),
            Container(height: 1, color: AppTheme.subText3.withOpacity(0.1)),
            SizedBox(height: AppDimensions.padding * 2),
            AboutUserHeading(
              label: "skills",
            ),
            SizedBox(height: AppDimensions.padding * 1),
            AboutUserSkills(skills: data.skills),
            SizedBox(height: AppDimensions.padding * 2),
            Container(height: 1, color: AppTheme.subText3.withOpacity(0.1)),
            SizedBox(height: AppDimensions.padding * 2),
            AboutUserHeading(
              label: "contacts",
            ),
            SizedBox(height: AppDimensions.padding * 2),
            AlphaBanner(
              text: App.translate(
                AboutDesignerScreenMessages.contactsDesc,
                context,
              ),
            ),
            ...data.contacts
                .map(
                  (contact) => AboutUserContactButton(
                    url: contact["url"],
                    icon: contact["icon"],
                    label: contact["label"],
                    initContext: Dimensions.init,
                    platform: contact["platform"],
                  ),
                )
                .toList(),
            SizedBox(height: AppDimensions.padding * 2),
          ],
        ),
      ),
    );
  }
}
