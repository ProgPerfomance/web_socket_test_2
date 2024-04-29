import 'dart:convert';
import 'dart:io';
import 'dart:async';
Map a = {
  'uid': '1',
  'message': 'fgjudfijidfifdid',
  'cid': '2',
  'requestType': 'message', //init
};
Future<void> main() async {
  while(true) {
    final socket = await WebSocket.connect('ws://63.251.122.116:2310');
    print('Connected to server');
  var uid =  stdin.readLineSync();
  var cid = stdin.readLineSync();
  var messageText = stdin.readLineSync();
  var message = {'uid': '$uid',
  'cid': '$cid', 'message': '$messageText',
  'requestType': 'message'};
      socket.add(jsonEncode(message));
    socket.listen(
          (message) {
        print('Received message: $message');
      },
    );
  //    final message = jsonEncode(a);
    
    // Timer.periodic(Duration(seconds: 2), (_) {

    // });
  }
}