import 'dart:isolate';

const String scope = 'SettingsScreen';

const Map strings = {
  // Title
  '$scope/message': 'This is just a static screen',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
