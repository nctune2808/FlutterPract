import 'dart:convert';

class BusDeparture {
  String line;
  String direction;
  String operator;
  String date;
  String expected_departure_time;
  String best_departure_estimate;
  String dir;

  BusDeparture({
    required this.line,
    required this.direction,
    required this.operator,
    required this.date,
    required this.expected_departure_time,
    required this.best_departure_estimate,
    required this.dir,
  });

  factory BusDeparture.fromJson(Map<String, dynamic> json) {
    return BusDeparture(
      line: json['line'],
      direction: json['direction'],
      operator: json['operator'],
      date: json['date'],
      expected_departure_time: json['expected_departure_time'],
      best_departure_estimate: json['best_departure_estimate'],
      dir: json['dir'],
    );
  }
}
