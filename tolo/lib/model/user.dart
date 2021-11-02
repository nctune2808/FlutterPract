import 'dart:convert';

import 'package:tolo/model/photo.dart';

class User {
  int? id; // NOT primary
  String? UUID; // <- PRIMARY KEY
  String? email;
  String? username;
  String? fullname;
  int? avatar_id; // <- FOREIGN

  User({
    this.id,
    this.UUID,
    this.email,
    this.username,
    this.fullname,
    this.avatar_id,
  });

  // toMap no passing autoID
  Map<String, dynamic> toMap() {
    return {
      'UUID': UUID,
      'email': email,
      'username': username,
      'fullname': fullname,
      'avatar_id': avatar_id,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] : null,
      UUID: map['UUID'] != null ? map['UUID'] : null,
      email: map['email'] != null ? map['email'] : null,
      username: map['username'] != null ? map['username'] : null,
      fullname: map['fullname'] != null ? map['fullname'] : null,
      avatar_id: map['avatar_id'] != null ? map['avatar_id'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    int? id,
    String? UUID,
    String? email,
    String? username,
    String? fullname,
    int? avatar_id,
  }) {
    return User(
      id: id ?? this.id,
      UUID: UUID ?? this.UUID,
      email: email ?? this.email,
      username: username ?? this.username,
      fullname: fullname ?? this.fullname,
      avatar_id: avatar_id ?? this.avatar_id,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, UUID: $UUID, email: $email, username: $username, fullname: $fullname, avatar_id: $avatar_id)';
  }
}
