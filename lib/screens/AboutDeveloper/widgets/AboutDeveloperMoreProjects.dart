import 'package:flutter/material.dart';
import 'package:invmovieconcept1/Utils.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/configs/App.dart';

import '../data.dart' as data;
import '../Dimensions.dart';
import '../models/Project.dart';

class AboutDeveloperMoreProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(4.0);

    return Container(
      height: Dimensions.projectCardHeight,
      width: Dimensions.projectCardWidth,
      child: ListView.builder(
        padding: EdgeInsets.all(
          AppDimensions.padding * 1,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: data.moreProjects.length,
        itemBuilder: (context, index) {
          final Project project = data.moreProjects[index];
          final List<ProjectLink> links = project.links;

          return Container(
            width: Dimensions.projectCardWidth,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.purple,
                  Theme.of(context).primaryColor,
                ],
              ),
              borderRadius: BorderRadius.circular(6.0),
            ),
            padding: EdgeInsets.all(
              AppDimensions.padding * 2,
            ),
            margin: EdgeInsets.all(
              AppDimensions.padding * 1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.label,
                  style: TextStyles.heading5.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  App.translate(project.desc, context),
                  style: TextStyles.body2.copyWith(
                    color: Colors.white.withOpacity(0.85),
                  ),
                ),
                Flexible(child: SizedBox(height: double.infinity)),
                Row(
                  children: links
                      .map(
                        (link) => Container(
                          margin: EdgeInsets.only(
                            right: App.isLtr ? AppDimensions.padding * 2 : 0.0,
                            left: !App.isLtr ? AppDimensions.padding * 2 : 0.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                            borderRadius: borderRadius,
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: borderRadius,
                              onTap: () => Utils.launchUrl(link.url),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: AppDimensions.padding,
                                  horizontal: AppDimensions.padding * 2,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      link.icon,
                                      color: Colors.white,
                                      size: TextStyles.body2.fontSize,
                                    ),
                                    SizedBox(width: AppDimensions.padding),
                                    Text(
                                      link.label,
                                      style: TextStyles.body2.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
