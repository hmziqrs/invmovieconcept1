import 'dart:isolate';

const String scope = 'DataRoot';

const Map strings = {
  '$scope/tagAction': "Action",
  '$scope/tagAdventure': "Adventure",
  '$scope/tagFantasy': "Fantasy",
  '$scope/tagDrama': "Drama",
  '$scope/tagSciFi': "Sci-Fi",
  '$scope/tagAnimation': "Animation",
  '$scope/tagComedy': "Comedy",
  '$scope/tagCrime': "Crime"
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
