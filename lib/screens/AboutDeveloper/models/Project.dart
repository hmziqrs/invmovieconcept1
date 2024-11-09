import 'package:flutter/material.dart';

class Project {
  final String label;
  final String desc;
  final List<ProjectLink> links;

  Project({
    required this.label,
    required this.desc,
    required this.links,
  });
}

class ProjectLink {
  final String label;
  final IconData icon;
  final String url;

  ProjectLink({
    required this.label,
    required this.icon,
    required this.url,
  });
}
