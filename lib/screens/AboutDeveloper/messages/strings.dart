import 'dart:isolate';

const String scope = 'AboutDeveloperScreen';

const Map strings = {
  // Title
  '$scope/title': 'About Developer',

  '$scope/intro':
      "Hi, I am a full-stack developer with over 7 years of experience in developing software. I have expertise in multiple languages and frameworks and am passionate about creating open-source apps. I enjoy watching anime in my free time, with Dragon Ball Z being my all-time favorite. I also play games, and some of my favorites include Cyberpunk 2077, Horizon Forbidden West, and Detroit: Become Human.",

  '$scope/skillSet': 'My Skill Set',
  '$scope/contacts': 'My Contacts',
  '$scope/contactsDesc':
      "I've shared my contacts strictly for business related queries ONLY.\nFor any Flutter related help post your query on Flutter Github, Flutter sub reddit & Flutter facebook groups",
  '$scope/likeProject': 'Like The Project?',
  '$scope/likeProjectDesc':
      "Show support by performing any action listed below.",
  '$scope/moreProjects': 'Explore More Projects',

  // Projects
  '$scope/projectFUD':
      "Simple implementation of complex UI designs and animations. In this project you will experience my journey of experimenting to find ideal flutter architecture.",
  '$scope/projectRNL':
      "Simple and elegant clone \"Loop game\" in react native with just simple setState & contexts for shared state.",
  '$scope/projectHCV':
      "Simple crafting of my creativity and imagination into web version of CV/Resume with the help of Pug/Sass/JS. Which highlights my career journey",

  // actions
  '$scope/likeProject1': "Star this repository",
  '$scope/likeProject2': "Review this app on",
  '$scope/likeProject3': "Endorse my skills on",
  '$scope/likeProject4': "Favorite my gigs on",

  // singulars
  '$scope/share': 'Share',
  '$scope/copy': 'Copy',
  '$scope/open': 'Open',
  '$scope/linkCopied': 'link copied',
  '$scope/or': 'or',
  '$scope/developers': "developer\'s",
  '$scope/profile': 'profile',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
