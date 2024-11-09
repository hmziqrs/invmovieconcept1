import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class DownloadLink {
  final String name;
  final String url;
  final IconData icon;

  const DownloadLink({
    required this.name,
    required this.url,
    required this.icon,
  });
}

final mobileLinks = [
  DownloadLink(
    name: "Play Store",
    url:
        "https://play.google.com/store/apps/details?id=com.onemdev.invmovieconcept1",
    icon: TeenyIcons.google_play_store,
  ),
  DownloadLink(
    name: "Apk",
    url:
        "https://github.com/hackerhgl/invmovieconcept1/releases/latest/download/app-release.apk",
    icon: TeenyIcons.android,
  ),
];

final desktopLinks = [
  DownloadLink(
    name: "Mac",
    url:
        "https://github.com/hackerhgl/invmovieconcept1/releases/latest/download/macos-release.zip",
    icon: TeenyIcons.apple,
  ),
  DownloadLink(
    name: "Linux",
    url:
        "https://github.com/hackerhgl/invmovieconcept1/releases/latest/download/linux-release.zip",
    icon: TeenyIcons.linux_alt,
  ),
  DownloadLink(
    name: "Windows",
    url:
        "https://github.com/hackerhgl/invmovieconcept1/releases/latest/download/windows-release.zip",
    icon: TeenyIcons.windows,
  ),
];

final webLinks = [
  DownloadLink(
    name: "Web",
    url: "https://invmovieconcept1.web.app",
    icon: TeenyIcons.globe,
  ),
  DownloadLink(
    name: "Github",
    url: "https://github.com/hackerhgl/invmovieconcept1",
    icon: TeenyIcons.github,
  ),
];
