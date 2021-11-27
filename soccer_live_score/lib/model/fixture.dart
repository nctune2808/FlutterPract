import 'package:soccer_live_score/model/status.dart';

class Fixture {
  int id;
  String date;
  Status status;

  Fixture({
    required this.id,
    required this.date,
    required this.status,
  });

  factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(
      id: json['id'],
      date: json['date'],
      status: Status.fromJson(json['status']),
    );
  }
}
