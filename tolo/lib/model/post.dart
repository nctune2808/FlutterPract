import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  int? id;
  String title;
  String body;
  DateTime? created_at;

  Post({
    this.id,
    required this.title,
    required this.body,
    this.created_at,
  });

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'title': title,
      'body': body,
      // 'created_at': created_at,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      created_at: DateTime.parse(map['created_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(id: $id, title: $title, body: $body, created_at: $created_at)';
  }
}
