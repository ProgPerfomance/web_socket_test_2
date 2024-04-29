import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() async {
  // Подключаемся к серверу WebSocket
  var socket = await WebSocket.connect('ws://63.251.122.116:2310');

  // Отправляем сообщение о присоединении к серверу
  var joinMessage = jsonEncode({'action': 'join'});
  socket.add(joinMessage);

  // Пример сообщения для отправки
  var messageToSend = {
    'cid': 'your_chat_id',
    'text': 'Hello, world!',
    // Другие данные вашего сообщения, если необходимо
  };

  // Периодически отправляем сообщения серверу
  var interval = Duration(seconds: 5);
  Timer.periodic(interval, (timer) {
    socket.add(jsonEncode(messageToSend));
  });

  // Прослушиваем сообщения от сервера
  socket.listen((dynamic data) {
    // Обработка полученных сообщений, если необходимо
    print('Received: $data');
  }, onError: (error) {
    // Обработка ошибок подключения
    print('Error: $error');
  }, onDone: () {
    // Действия при закрытии соединения
    print('Connection closed');
  });

  // Программа продолжит работу, пока соединение открыто
}
