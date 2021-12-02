import 'dart:convert';

class Games {
  int? appearences;
  int? lineups;
  int? minutes;
  int? number; // null
  String position;
  String? rating;
  bool captain;

  Games({
    required this.appearences,
    required this.lineups,
    required this.minutes,
    this.number,
    required this.position,
    this.rating,
    required this.captain,
  });

  factory Games.fromJson(Map<String, dynamic> json) {
    return Games(
      appearences: json['appearences'],
      lineups: json['lineups'],
      minutes: json['minutes'],
      number: json['number'],
      position: json['position'],
      rating: json['rating'],
      captain: json['captain'],
    );
  }
}
