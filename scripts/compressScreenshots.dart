import 'dart:io';
import 'dart:isolate';
import 'package:image/image.dart' as image;

import 'utils.dart';

final source = "screenshots";
final start = DateTime.now();

final receive = ReceivePort();

test(SendPort sendPort) {
  print("message 1");
  receive.listen((message) {
    print("message $message");
  });
  // print("$v. WWW");
}

void main() {
  generate(source);
}

void generate(String path) {
  // final dir = Directory(path).list();
  // dir.listen((event) async {
  //   final filePath = event.uri.toFilePath();
  //   final file = File(filePath);
  //   if (await file.exists()) {
  //     if (filePath.contains(".png")) {
  //       print(DateTime.now().difference(start).inMilliseconds);
  //     }
  //   } else {
  //     generate(filePath);
  //     // compute(generate, filePath);
  //     print("IS NOT FILE");
  //   }
  // });

  final dir = Directory(path).listSync();
  dir.forEach((event) async {
    final filePath = event.uri.toFilePath();
    final file = File(filePath);
    if (await file.exists()) {
      if (filePath.contains(".png")) {
        final bytes = await file.readAsBytes();
        final decoded = image.decodeImage(bytes)!;
        final newFile = File(filePath.replaceFirst(".png", ".jpg"));
        final resized = image.copyResize(decoded, width: 160);
        newFile.writeAsBytesSync(image.encodeJpg(resized));
        print(DateTime.now().difference(start).inMilliseconds);
      }
    } else {
      generate(filePath);
      // final isolate = Isolate.spawn(test, receive.sendPort);
      // receive.sendPort.send(filePath);
      // await isolate;
      // compute(generate, filePath);
      print("IS NOT FILE");
    }
  });
}
