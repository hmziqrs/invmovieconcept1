import 'dart:isolate';

const String scope = 'DownloadScreen';

const Map strings = {
  // Title
  '$scope/title': 'Download',
  '$scope/desc':
      'Explore app on a different platform or share the link directly with anyone who may be interested in exploring the app',
  '$scope/mobile': 'Mobile',
  '$scope/desktop': 'Desktop',
  '$scope/web': 'Web',
  //
  '$scope/alertTitleMobile': 'Share or Download',
  '$scope/alertTitleOthers': 'Share or Copy Link',
  '$scope/copy': 'COPY',
  '$scope/share': 'SHARE',
  '$scope/download': 'DOWNLOAD',
  '$scope/close': 'CLOSE',
  '$scope/linkCopied': 'link copied',
};

main(List<String> args, SendPort port) {
  port.send({"strings": strings, "scope": scope});
}
