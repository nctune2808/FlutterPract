import 'dart:convert';

import 'package:tolo/model/photo.dart';
import 'package:tolo/model/user.dart';

class Profile {
  int? id;
  User? user;
  Photo? photo;
  Profile({
    this.id,
    this.user,
    this.photo,
  });

  Profile copyWith({
    int? id,
    User? user,
    Photo? photo,
  }) {
    return Profile(
      id: id ?? this.id,
      user: user ?? this.user,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user?.toMap(),
      'photo': photo?.toMap(),
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'],
      user: map['user'] != null ? User.fromMap(map['user']) : null,
      photo: map['photo'] != null ? Photo.fromMap(map['photo']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source));
}
