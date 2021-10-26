import 'dart:convert';

import 'package:tolo/model/post.dart';
import 'package:tolo/model/user.dart';

class Wall {
  int? id;
  Post? post;
  User? user;
  DateTime? created_at;
  Wall({
    this.id,
    this.post,
    this.user,
    this.created_at,
  });

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'post': post?.toMap(),
      'user': user?.toMap(),
    };
  }

  factory Wall.fromMap(Map<String, dynamic> map) {
    return Wall(
      id: map['id'],
      post: map['post'] != null ? Post.fromMap(map['post']) : null,
      user: map['user'] != null ? User.fromMap(map['user']) : null,
      created_at: DateTime.parse(map['created_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Wall.fromJson(String source) => Wall.fromMap(json.decode(source));

  Wall copyWith({
    int? id,
    Post? post,
    User? user,
    DateTime? created_at,
  }) {
    return Wall(
      id: id ?? this.id,
      post: post ?? this.post,
      user: user ?? this.user,
      created_at: created_at ?? this.created_at,
    );
  }

  @override
  String toString() {
    return 'Wall(id: $id, post: $post, user: $user, created_at: $created_at)';
  }
}
