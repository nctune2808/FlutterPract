import 'package:shoping_list_bloc/model/user.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool seen;
  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.seen,
  });
}
