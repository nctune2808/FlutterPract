import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String? id;
  final String? sender;
  final String text;
  final bool? isLiked;
  final bool? seen;
  final Timestamp? time;

  Message({
    this.id,
    this.sender,
    required this.text,
    this.isLiked,
    this.seen,
    this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'sender': sender,
      'text': text,
      'isLiked': isLiked,
      'seen': seen,
      'time': time,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      sender: map['sender'],
      text: map['text'],
      isLiked: map['isLiked'],
      seen: map['seen'],
      time: map['time'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source));

  Message copyWith({
    String? id,
    String? sender,
    String? text,
    bool? isLiked,
    bool? seen,
    Timestamp? time,
  }) {
    return Message(
      id: id ?? this.id,
      sender: sender ?? this.sender,
      text: text ?? this.text,
      isLiked: isLiked ?? this.isLiked,
      seen: seen ?? this.seen,
      time: time ?? this.time,
    );
  }

  @override
  String toString() {
    return 'Message(id: $id, sender: $sender, text: $text, isLiked: $isLiked, seen: $seen, time: $time)';
  }
}
