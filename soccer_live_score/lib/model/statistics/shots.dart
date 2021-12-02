import 'dart:convert';

class Shots {
  int total;
  int on;

  Shots({
    required this.total,
    required this.on,
  });

  factory Shots.fromJson(Map<String, dynamic> json) {
    return Shots(
      total: json['total'],
      on: json['on'],
    );
  }
}
