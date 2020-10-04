import 'dart:isolate';

const String scope = 'AlertWidget';

const Map strings = {
  // Title
  '$scope/close': 'Close',
  '$scope/copy': 'Copy',
  '$scope/share': 'Share',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
