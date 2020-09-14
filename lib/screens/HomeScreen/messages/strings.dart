import 'dart:isolate';

const String scope = 'HomeScreen';

const Map strings = {
  '$scope/title': 'Welcome',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
