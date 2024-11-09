import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'messages/keys.dart';

final devDescription = [
  AboutDesignerScreenMessages.desc1,
  AboutDesignerScreenMessages.desc2,
];

final skills = [
  "UI Designing (Web and Mobile)",
  "Rapid Prototyping",
  "After effects JSON Animation",
  "Graphic Designing",
  "Branding",
  "motion graphics",
];

class Contact {
  final String platform;
  final String label;
  final IconData icon;
  final String? url;

  Contact({
    required this.platform,
    required this.label,
    required this.icon,
    this.url,
  });
}

final contacts = [
  Contact(
    platform: "dribbble",
    label: "aneeshravi",
    icon: TeenyIcons.dribbble,
  ),
  Contact(
    platform: "linkedin",
    label: "aneesh-r",
    icon: TeenyIcons.linkedin,
  ),
  Contact(
    platform: "instagram",
    label: "me_aneeshravi",
    icon: TeenyIcons.instagram,
  ),
  Contact(
    platform: "lottiefiles",
    label: "Aneesh Lottie files",
    icon: TeenyIcons.globe,
    url: "https://lottiefiles.com/aneeshravi",
  ),
];
