import 'dart:isolate';

const String scope = 'MovieDetailScreen';

const Map strings = {
  // Title
  '$scope/select': 'Select Seats',
  '$scope/description': 'Description',
  '$scope/cast': 'Cast',
  '$scope/castName': 'Cast Name',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
