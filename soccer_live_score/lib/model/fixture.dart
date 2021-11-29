import 'package:soccer_live_score/model/status.dart';
import 'package:soccer_live_score/model/venue.dart';

class Fixture {
  int id;
  String date;
  Status status;
  Venue venue;

  Fixture({
    required this.id,
    required this.date,
    required this.status,
    required this.venue,
  });

  factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(
      id: json['id'],
      date: json['date'],
      status: Status.fromJson(json['status']),
      venue: Venue.fromJson(json['venue']),
    );
  }
}
