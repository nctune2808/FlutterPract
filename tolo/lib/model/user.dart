import 'dart:convert';

import 'package:tolo/model/photo.dart';

class User {
  int? id; // NOT primary
  String? UUID; // <- PRIMARY KEY
  String? email;
  String? username;
  String? fullname;
  Photo? photo; // <- FOREIGN

  User({
    this.id,
    this.UUID,
    this.email,
    this.username,
    this.fullname,
    this.photo,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'UUID': UUID,
      'email': email,
      'username': username,
      'fullname': fullname,
      'photo': photo?.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] : null,
      UUID: map['UUID'] != null ? map['UUID'] : null,
      email: map['email'] != null ? map['email'] : null,
      username: map['username'] != null ? map['username'] : null,
      fullname: map['fullname'] != null ? map['fullname'] : null,
      photo: map['photo'] != null ? Photo.fromMap(map['photo']) : null,
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
    Photo? photo,
  }) {
    return User(
      id: id ?? this.id,
      UUID: UUID ?? this.UUID,
      email: email ?? this.email,
      username: username ?? this.username,
      fullname: fullname ?? this.fullname,
      photo: photo ?? this.photo,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, UUID: $UUID, email: $email, username: $username, fullname: $fullname, photo: $photo)';
  }
}
