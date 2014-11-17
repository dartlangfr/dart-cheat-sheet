import 'dart:html';
import 'dart:async';

void main() {
  drawCanvas();
  runSocket("anyData");
  eventSource();
  sendHttpRequest();
  webRTC();
  localStorage();
  indexDB();
}

void buttonEvent(){
  var buttonElem = querySelector("#myButton");
  buttonElem.onClick.listen((MouseEvent event) {
    print(event);
  });
}

sendHttpRequest(){
  HttpRequest.getString('http://theUrl').then((response) {
    print(response);
  });
}

void drawCanvas(){
  CanvasElement canvas =
     new CanvasElement(width: 600, height: 600);
  CanvasRenderingContext2D ctx = canvas.context2D;
  ImageElement img = document.querySelector('img');

  ctx.drawImage(img, 100, 100);
}

void runSocket(data){
  var webSocket = new WebSocket('ws://127.0.0.1:1337/ws');
  if (webSocket != null && webSocket.readyState == WebSocket.OPEN) {
    webSocket.send(data);
  } else {
    print('WebSocket not connected');
  }
  webSocket.onMessage.listen((MessageEvent e) {
    print(e.data);
  });  
}

void eventSource(){
  var source = new EventSource('/the/url')
    ..onError.listen((Event e) => print('Error: $e'))
    ..onOpen.listen((Event e) => print('Open'))
    ..onMessage.listen((MessageEvent me) =>
            print('Message: ${me.data}')
      );
}

var reader = new FileReader();
var fileInput = querySelector('#fileInput')
                ..onChange.listen(_onFileChange);

_onFileChange(e){
  reader..readAsText(fileInput.files[0])
        ..onLoad.listen((e2) {
           print(reader.result);      
        });
}

void webRTC(){
  window.navigator
    .getUserMedia(audio: true, video: true)
    .then(_onStream);
}


_onStream(stream) {
  var video = new VideoElement()
   ..autoplay = true
   ..src = Url.createObjectUrlFromStream(stream)
   ..onLoadedMetadata.listen((e) {
     // Ready
   });
  document.body.append(video);
}

void localStorage(){
  var foo = window.localStorage['bar'];
  window.localStorage['bar'] = "foo";
}

void indexDB(){
  Future open() {
    return window.indexedDB.open('myIndexedDB',
        version: 1,
        onUpgradeNeeded: _initializeDatabase)
      .then(_loadFromDB);
  }
}

_initializeDatabase(VersionChangeEvent e) {
  // Initialize your database
}
Future _loadFromDB(Database db) {
  // Load request
}