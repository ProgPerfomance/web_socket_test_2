import 'dart:convert';
import 'dart:io';

void main() async {
  var socket = await WebSocket.connect('ws://63.251.122.116:2310');

  var joinMessage = jsonEncode({'action': 'join'});
  socket.add(joinMessage);

  socket.listen((dynamic data) {
    // Обработка полученных сообщений
    print('Received: $data');
  }, onError: (error) {
    // Обработка ошибок подключения
    print('Error: $error');
  }, onDone: () {
    // Действия при закрытии соединения
    print('Connection closed');
  });

  // Чтение сообщений с консоли и отправка на сервер
  // stdin.listen((data) {
  //   var input = String.fromCharCodes(data).trim();
  //   var messageToSend = {
  //     'cid': 'your_chat_id',
  //     'text': input,
  //   };
  //   socket.add(jsonEncode(messageToSend));
  // });
}

//