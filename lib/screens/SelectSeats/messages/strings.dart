import 'dart:isolate';

const String scope = 'SelectSeatsScreen';

const Map strings = {
  // Title
  '$scope/buyNow': 'Buy Now',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
