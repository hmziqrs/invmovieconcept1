import 'package:flutter/material.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';
import 'package:invmovieconcept1/Utils.dart';
import 'package:invmovieconcept1/screens/Download/widgets/DownloadLink.dart';

import 'package:invmovieconcept1/widgets/Buttons/BackIcon.dart';
import 'package:invmovieconcept1/widgets/Screen/Screen.dart';

import 'data.dart' as data;
import 'Dimensions.dart';
import 'widgets/AboutDeveloperMoreProjects.dart';

class AboutDeveloperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    final textColor = Theme.of(context).textTheme.bodyText1.color;

    return Screen(
      child: Align(
        child: Container(
          width: AppDimensions.containerWidth,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                padding: Utils.safePaddingUnit(context, "top"),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color: AppTheme.lightShadow,
                    )
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      BackIconButton(onPressed: () {}),
                      Container(
                        // color: Colors.red,
                        padding: EdgeInsets.all(AppDimensions.padding * 2),
                        child: Text(
                          "About Developer",
                          style: TextStyles.heading46,
                        ),
                      ),
                    ],
                  ),
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
                  style: TextStyles.body16.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.padding * 1),
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
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 1,
                ),
                child: Wrap(
                  children: data.skills
                      .map(
                        (text) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: Theme.of(context).scaffoldBackgroundColor,
                            border: Border.all(
                              width: 1.6,
                              color: Theme.of(context).primaryColor,
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.0, 1.0),
                                blurRadius: 3,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.30),
                              ),
                            ],
                          ),
                          margin: EdgeInsets.all(
                            AppDimensions.padding * 1,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: AppDimensions.padding * 1.2,
                            horizontal: AppDimensions.padding * 2,
                          ),
                          child: Text(
                            text.toUpperCase(),
                            style: TextStyles.body27,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
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
              Container(
                width: double.infinity,
                color: textColor.withOpacity(0.65),
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 2,
                  vertical: AppDimensions.padding * 1.0,
                ),
                child: Text(
                  "I've shared my contacts strictly for buissness related queries ONLY.\nFor any Flutter related help post your query on Flutter Github, Flutter sub reddit & Flutter facebook groups",
                  style: TextStyles.body17.copyWith(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.padding * 1),
              ...data.contacts
                  .map(
                    (contact) => DownloadLink(
                      icon: contact["icon"],
                      label: contact["username"],
                      link: Utils.socialLink(
                        contact["username"],
                        contact["platform"],
                      ),
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
              Container(
                width: double.infinity,
                color: textColor.withOpacity(0.65),
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 2,
                  vertical: AppDimensions.padding * 1.0,
                ),
                child: Text(
                  "Show support by performing any action listed below.",
                  style: TextStyles.body17.copyWith(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.padding * 1),
              ...data.showSupport
                  .map(
                    (support) => DownloadLink(
                      icon: support["icon"],
                      label: support["text"],
                      link: support["link"],
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
      ),
    );
  }
}
