import 'dart:convert';

class Passes {
  int total;
  int key;
  int accuracy;

  Passes({
    required this.total,
    required this.key,
    required this.accuracy,
  });

  factory Passes.fromJson(Map<String, dynamic> json) {
    return Passes(
      total: json['total'],
      key: json['key'],
      accuracy: json['accuracy'],
    );
  }
}
