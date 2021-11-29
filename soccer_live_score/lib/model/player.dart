import 'dart:convert';

class Player {
  int id;
  String name;
  String firstname;
  String lastname;
  int age;
  String nationality;
  String? height;
  String? weight;
  String photo;

  Player({
    required this.id,
    required this.name,
    required this.firstname,
    required this.lastname,
    required this.age,
    required this.nationality,
    required this.height,
    required this.weight,
    required this.photo,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      name: json['name'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      age: json['age'],
      nationality: json['nationality'],
      height: json['height'],
      weight: json['weight'],
      photo: json['photo'],
    );
  }
}
