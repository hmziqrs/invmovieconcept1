import 'package:icons_plus/icons_plus.dart';

import 'package:invmovieconcept1/static/Links.dart';

import 'messages/keys.dart';
import 'models/Contact.dart';
import 'models/Support.dart';
import 'models/Project.dart';

final devDescription = [
  AboutDeveloperScreenMessages.intro,
];

final skills = [
  "Rust",
  "Flutter",
  "React Native",
  "NextJS",
  "Typescript",
  "Firebase",
  "NodeJS",
  "PostgresSQL",
];

const username = "hmziqrs";
const email = "hmziqrs@gmail.com";

final contacts = [
  Contact(
    platform: "twitter",
    label: "@$username",
    icon: IonIcons.logo_twitter,
    url: "https://x.com/$username",
  ),
  Contact(
    platform: "gmail",
    label: "$email",
    icon: IonIcons.mail,
    url: "mailto:$email",
  ),
  Contact(
    platform: "telegram",
    label: "@$username",
    icon: IonIcons.paper_plane,
    url: "https://t.me/$username",
  ),
  Contact(
    platform: "web",
    label: "hmziq.rs",
    icon: IonIcons.globe,
    url: "https://hmziq.rs",
  ),
];

final showSupport = [
  Support(
    label: AboutDeveloperScreenMessages.likeProject1,
    icon: TeenyIcons.github,
    link: MyLinks.invmovieconcept1Github,
  ),
  Support(
    platform: "Play Store",
    label: AboutDeveloperScreenMessages.likeProject2,
    icon: TeenyIcons.google_play_store,
    link: MyLinks.invmovieconcept1GooglePlay,
  ),
];

final moreProjects = [
  Project(
    label: "Flutter UI Designs",
    desc: AboutDeveloperScreenMessages.projectFUD,
    links: [
      ProjectLink(
        label: "Google Play",
        icon: TeenyIcons.google_play_store,
        url:
            "https://play.google.com/store/apps/details?id=com.onemdev.flutter_ui_challenges",
      ),
      ProjectLink(
        label: "Github",
        icon: TeenyIcons.github,
        url: "https://github.com/hmziqrs/flutter-ui-designs",
      ),
      ProjectLink(
        label: "Web",
        icon: TeenyIcons.globe,
        url: "https://flutter-uis.hmziq.xyz",
      ),
    ],
  ),
  Project(
    label: "Epic Gandalf Sax Infinite",
    desc: AboutDeveloperScreenMessages.projectRNL,
    links: [
      ProjectLink(
        label: "Google Play",
        icon: TeenyIcons.google_play_store,
        url:
            "https://play.google.com/store/apps/details?id=com.onemdev.gandalf",
      ),
      ProjectLink(
        label: "Github",
        icon: TeenyIcons.github,
        url: "https://github.com/hmziqrs/gandalf-sax",
      ),
      ProjectLink(
        label: "web",
        icon: IonIcons.globe,
        url: "https://gandalf.hmziq.xyz",
      ),
    ],
  ),
  Project(
    label: "React Native Loop",
    desc: AboutDeveloperScreenMessages.projectRNL,
    links: [
      ProjectLink(
        label: "Google Play",
        icon: TeenyIcons.google_play_store,
        url:
            "https://play.google.com/store/apps/details?id=com.onemdev.rnloop",
      ),
      ProjectLink(
        label: "Github",
        icon: TeenyIcons.github,
        url: "https://github.com/hmziqrs/react-native-loop-game",
      ),
      ProjectLink(
        label: "Web",
        icon: TeenyIcons.globe,
        url: "https://rnloop.hmziq.xyz",
      ),
    ],
  ),
  Project(
    label: "hmziqrs CV",
    desc: AboutDeveloperScreenMessages.projectHCV,
    links: [
      ProjectLink(
        label: "Website",
        icon: TeenyIcons.globe,
        url: "http://cv.hmziq.rs",
      ),
      ProjectLink(
        label: "Github",
        icon: TeenyIcons.github,
        url: "https://github.com/hmziqrs/cv",
      ),
    ],
  ),
];
