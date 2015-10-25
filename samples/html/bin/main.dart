import 'dart:io';
import 'dart:async';
import 'package:http_server/http_server.dart';

void main() async {
  await runZoned(() {
    startServer();
  },
  onError: (e, stackTrace) => print('Oh noes! $e $stackTrace'));
}

startServer() async {
  var staticFiles = new VirtualDirectory('web')
    ..allowDirectoryListing = true;

  var server = await HttpServer.bind('127.0.0.1', 3000);
  await for (HttpRequest req in server) {
    if (req.uri.path == '/ws') {
      handleWebSocket(req);
    } else {
      staticFiles.serveRequest(req);
    }
  }
}

handleWebSocket(req) async {
  // Upgrade an HttpRequest to a WebSocket connection.
  var socket = await WebSocketTransformer.upgrade(req);
  socket.listen((msg) {
    print('Message received: $msg');
    socket.add(msg);
  });
}
