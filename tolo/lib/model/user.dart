import 'dart:convert';

class User {
  int? id; // NOT primary
  String? UUID; // <- PRIMARY KEY
  String? email;
  String? username;
  String? fullname;

  User({
    this.id,
    this.UUID,
    this.email,
    this.username,
    this.fullname,
  });

  Map<String, dynamic> toMap() {
    return {
      'UUID': UUID,
      'email': email,
      'username': username,
      'fullname': fullname,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      UUID: map['UUID'],
      email: map['email'],
      username: map['username'],
      fullname: map['fullname'],
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
  }) {
    return User(
      id: id ?? this.id,
      UUID: UUID ?? this.UUID,
      email: email ?? this.email,
      username: username ?? this.username,
      fullname: fullname ?? this.fullname,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, UUID: $UUID, email: $email, username: $username, fullname: $fullname)';
  }
}
