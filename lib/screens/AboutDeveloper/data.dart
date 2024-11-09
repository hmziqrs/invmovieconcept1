import 'package:icons_plus/icons_plus.dart';

import 'package:invmovieconcept1/static/Links.dart';

import 'messages/keys.dart';
import 'models/Contact.dart';
import 'models/Support.dart';
import 'models/Project.dart';

final devDescription = [
  AboutDeveloperScreenMessages.desc1,
  AboutDeveloperScreenMessages.desc2,
  AboutDeveloperScreenMessages.desc3,
  AboutDeveloperScreenMessages.desc4,
];

final skills = [
  "HTML/CSS",
  "Pug(Jade)",
  "Sass/Less",
  "Javascript",
  "JQuery",
  "React JS",
  "React SSR",
  "Redux",
  "Redux Saga",
  "React Native",
  "Dart",
  "Flutter",
  "Firebase",
  "Photoshop",
  "Basic UI designs",
  "Node JS",
  "Express JS",
  "MYSQL",
  "Mongo DB",
  "Socket.IO",
  "Go lang",
  "Dart Server",
  "Automation Scripting",
];

final contacts = [
  Contact(
    platform: "facebook",
    label: "hackerhgl",
    icon: TeenyIcons.facebook,
  ),
  Contact(
    platform: "linkedin",
    label: "hackerhgl",
    icon: TeenyIcons.linkedin,
  ),
  Contact(
    platform: "skype",
    label: "hamza.iqbal.jawaid.iqbal",
    icon: TeenyIcons.skype,
    url: "https://join.skype.com/invite/XGRknTea0kKf",
  ),
  Contact(
    platform: "whatsapp",
    label: "+923148155304",
    icon: TeenyIcons.whatsapp,
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
  Support(
    platform: "Linkedin",
    label: AboutDeveloperScreenMessages.likeProject3,
    icon: TeenyIcons.linkedin,
    link: "https://www.linkedin.com/in/hackerhgl/",
  ),
  Support(
    platform: "Fiverr",
    label: AboutDeveloperScreenMessages.likeProject4,
    icon: TeenyIcons.heart,
    link: "https://www.fiverr.com/hackerhgl",
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
        url: "https://github.com/hackerhgl/flutter-ui-designs",
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
        url: "https://github.com/hackerhgl/react-native-loop-game",
      ),
    ],
  ),
  Project(
    label: "Hackerhgl CV",
    desc: AboutDeveloperScreenMessages.projectHCV,
    links: [
      ProjectLink(
        label: "Website",
        icon: TeenyIcons.globe,
        url: "http://hackerhgl-cv.web.app",
      ),
      ProjectLink(
        label: "Github",
        icon: TeenyIcons.github,
        url: "https://github.com/hackerhgl/CV",
      ),
    ],
  ),
];
