import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/AppTheme.dart';

import 'package:invmovieconcept1/Utils.dart';
import 'package:invmovieconcept1/widgets/Buttons/Alpha.dart';

import 'package:invmovieconcept1/widgets/Header/Header.dart';
import 'package:invmovieconcept1/widgets/Banners/Alpha.dart';

import 'package:invmovieconcept1/widgets/Screen/Screen.dart';

import 'widgets/AboutDeveloperMoreProjects.dart';

import 'data.dart' as data;
import 'Dimensions.dart';
import 'widgets/AboutDeveloperMySkills.dart';

class AboutDeveloperScreen extends StatelessWidget {
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
    Dimensions.init(context);

    return Screen(
      child: Align(
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
                    (obj) => this.mapButton(obj, () {}),
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
                    (obj) => this.mapButton(obj, () {}),
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
