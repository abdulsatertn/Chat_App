import 'package:chat_app_second/constants.dart';

class Message {
  final String message;
  final String id;

  Message(this.message, this.id);

  factory Message.fromJson(jsonData) {
    // Check if 'content' key exists and is not null
    if (jsonData['messages'] != null) {
      // Extract the 'content' field
      String content = jsonData['messages'] as String;

      // Extract the 'id' field, or provide a default value if it's null
      String id =
          jsonData['id'] != null ? jsonData['id'] as String : 'abcd@gmail.com';

      return Message(id, content);
    } else {
      // Handle the case where 'content' is missing or null
      throw Exception("Invalid message JSON: $jsonData");
    }
  }

  // factory Message.fromJson(jsonData) {
  //   return Message(
  //     jsonData['messages'] as String,
  //     jsonData['id'] as String,
  //   );
  // }

  // factory Message.fromJson(jsonData) {
  //   return Message(
  //     jsonData['messages'],
  //     jsonData['id'],
  //   );
  // }
}
