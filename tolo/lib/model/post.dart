import 'dart:convert';

class Post {
  int? id;
  String title;
  String body;
  bool read;
  DateTime? created_at;

  Post({
    this.id,
    required this.title,
    required this.body,
    required this.read,
    this.created_at,
  });

// created_at: DateTime.parse(map['created_at']),

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'title': title,
      'body': body,
      'read': read,
      // 'created_at': created_at,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      read: map['read'],
      created_at: DateTime.parse(map['created_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(id: $id, title: $title, body: $body, read: $read, created_at: $created_at)';
  }

  Post copyWith({
    int? id,
    String? title,
    String? body,
    bool? read,
    DateTime? created_at,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      read: read ?? this.read,
      created_at: created_at ?? this.created_at,
    );
  }
}
