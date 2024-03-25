import 'package:chat_app_second/constants.dart';

class Message {
  final String message;
  final String id;

  Message(this.message, this.id);

  factory Message.fromJson(jsonData) {
    return Message(
      jsonData['messages'] as String,
      jsonData['id'] as String,
    );
  }

  // factory Message.fromJson(jsonData) {
  //   return Message(
  //     jsonData['messages'],
  //     jsonData['id'],
  //   );
  // }
}
