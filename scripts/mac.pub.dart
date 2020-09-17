import 'package:universal_io/io.dart';

void main(args) {
  final file = File("pubspec.yaml");
  final fileData = file.readAsStringSync().split("\n").toList();
  final List<String> newDataList =
      fileData.where((element) => !element.contains("firebase")).toList();
  final newData = newDataList.join("\n");

  final newFile = File("pubspec.yaml");
  newFile.writeAsString(newData);
}
