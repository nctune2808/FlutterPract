import 'package:chat_room/models/User.dart';

class Conversation {
  final User sender;
  final String time;
  final List<String> text;

  Conversation(this.sender, this.time, this.text);
}
