import 'dart:convert';

class Dribbles {
  int? attempts;
  int? success;
  int? past; // null

  Dribbles({
    required this.attempts,
    required this.success,
    required this.past,
  });

  factory Dribbles.fromJson(Map<String, dynamic> json) {
    return Dribbles(
      attempts: json['attempts'],
      success: json['success'],
      past: json['past'],
    );
  }
}
