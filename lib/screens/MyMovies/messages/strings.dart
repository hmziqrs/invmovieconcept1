import 'dart:isolate';

const String scope = 'MyMoviesScreen';

const Map strings = {
  '$scope/myMovies': 'My Movies',
  '$scope/seats': 'SEATS',
  '$scope/notFound': 'No Movies Found',
  '$scope/clear': 'Clear All movies',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
