import 'dart:isolate';

const String scope = 'AboutDesignerScreen';

const Map strings = {
  '$scope/title': "About Designer",
  '$scope/contactsDesc':
      "Contacts are shared strictly for business related queries ONLY",
  '$scope/desc1':
      "I have 7 years of experience and strong knowledge in User Interface Designing in Web and Mobile platforms.",
  '$scope/desc2':
      "Skilled in App UI Interaction animation in after effects and Lottie Json",
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
