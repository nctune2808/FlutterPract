import 'dart:convert';

class Venue {
  String name;
  String city;

  Venue({
    required this.name,
    required this.city,
  });

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      name: json['name'],
      city: json['city'],
    );
  }
}
