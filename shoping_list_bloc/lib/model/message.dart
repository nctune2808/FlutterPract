import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String? sender;
  final String text;
  final bool? isLiked;
  final bool? seen;
  final Timestamp? time;
  Message({
    this.sender,
    required this.text,
    this.time,
    this.isLiked,
    this.seen,
  });
}
