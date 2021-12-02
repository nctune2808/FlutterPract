import 'dart:convert';

class Penalty {
  int won;
  int commited; // null
  int scored;
  int missed;
  int saved; // null

  Penalty({
    required this.won,
    required this.commited,
    required this.scored,
    required this.missed,
    required this.saved,
  });

  factory Penalty.fromJson(Map<String, dynamic> json) {
    return Penalty(
      won: json['won'],
      commited: json['commited'],
      scored: json['scored'],
      missed: json['missed'],
      saved: json['saved'],
    );
  }
}
