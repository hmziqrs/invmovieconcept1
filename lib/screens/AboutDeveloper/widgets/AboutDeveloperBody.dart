import 'package:flutter/material.dart';
import 'package:invmovieconcept1/UI.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/configs/App.dart';

import 'package:invmovieconcept1/Utils.dart';

import 'package:invmovieconcept1/widgets/AboutUser/AboutUserContactButton.dart';
import 'package:invmovieconcept1/widgets/AboutUser/AboutUserJobTitle.dart';
import 'package:invmovieconcept1/widgets/AboutUser/AboutUserHeading.dart';
import 'package:invmovieconcept1/widgets/AboutUser/AboutUserSkills.dart';
import 'package:invmovieconcept1/widgets/AboutUser/AboutUserName.dart';
import 'package:invmovieconcept1/widgets/AboutUser/AboutUserBio.dart';

import 'package:invmovieconcept1/widgets/Buttons/Alpha.dart';
import 'package:invmovieconcept1/widgets/Header/Header.dart';
import 'package:invmovieconcept1/widgets/Banners/Alpha.dart';

import 'AboutDeveloperMoreProjects.dart';

import '../messages/keys.dart';
import '../data.dart' as data;
import '../Dimensions.dart';
import '../TestKeys.dart';
import '../models/Support.dart';

class AboutDeveloperBody extends StatelessWidget {
  Widget mapSupportButton(
    BuildContext context,
    Support obj,
  ) {
    final buttonMargin = EdgeInsets.only(
      top: AppDimensions.padding * 2,
      left: AppDimensions.padding * 2,
      right: AppDimensions.padding * 2,
    );
    final prefix = obj.platform;

    String label = obj.label;

    if (prefix != null) {
      label = App.translate(label) + " " + prefix;
    }

    return AlphaButton(
      icon: obj.icon,
      margin: buttonMargin,
      label: (App.translate(label, context)).toUpperCase(),
      onTap: () => Utils.launchUrl(obj.link),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
        children: [
          Header(
            label: AboutDeveloperScreenMessages.title,
            onBack: () => Navigator.popUntil(
              context,
              ModalRoute.withName("home"),
            ),
          ),
          Expanded(
            child: ListView(
              key: Key(AboutDeveloperTestKeys.rootScroll),
              padding: EdgeInsets.zero,
              children: <Widget>[
                SizedBox(height: AppDimensions.padding * 1),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: AppDimensions.maxContainerWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AboutUserName(name: "Hamza Iqbal"),
                        AboutUserJobTitle(
                          label:
                              "Full Stack Engineer | Rust, Flutter, React Native",
                        ),
                        AboutUserBio(points: data.devDescription),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.padding * 3),
                Container(height: 1, color: AppTheme.subText3.withOpacity(0.1)),
                SizedBox(height: AppDimensions.padding * 2),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: AppDimensions.maxContainerWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AboutUserHeading(
                          label: "skills",
                        ),
                        SizedBox(height: AppDimensions.padding * 1),
                        AboutUserSkills(
                          skills: data.skills,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.padding * 2),
                Container(height: 1, color: AppTheme.subText3.withOpacity(0.1)),
                SizedBox(height: AppDimensions.padding * 2),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: AppDimensions.maxContainerWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AboutUserHeading(label: "contacts"),
                        SizedBox(height: AppDimensions.padding * 1),
                        ...data.contacts
                            .map(
                              (contact) => AboutUserContactButton(
                                url: contact.url,
                                icon: contact.icon,
                                label: contact.label,
                                initContext: Dimensions.init,
                                platform: contact.platform,
                              ),
                            )
                            .toList()
                      ],
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.padding * 3),
                Container(height: 1, color: AppTheme.subText3.withOpacity(0.1)),
                SizedBox(height: AppDimensions.padding * 2),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: AppDimensions.maxContainerWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AboutUserHeading(
                          label: "likeProject",
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
                              (obj) => this.mapSupportButton(context, obj),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                ),


                SizedBox(height: AppDimensions.padding * 3),
                Container(height: 1, color: AppTheme.subText3.withOpacity(0.1)),
                SizedBox(height: AppDimensions.padding * 2),

                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: AppDimensions.maxContainerWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AboutUserHeading(
                          label: "moreProjects",
                        ),
                        SizedBox(height: AppDimensions.padding * 1),
                        AboutDeveloperMoreProjects(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: UI.padding.bottom),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
