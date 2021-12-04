import 'dart:convert';

import 'package:transport_real_time/models/location.dart';

class Place {
  String? name;
  String place_id;
  String? description;
  List<String>? types;
  String? formatted_address;
  Location? location;

  Place({
    this.name,
    required this.place_id,
    this.description,
    this.types,
    this.formatted_address,
    this.location,
  });

  factory Place.fromJson(Map<String, dynamic> json, bool isRequired) {
    return Place(
      name: json['name'],
      place_id: json['place_id'],
      description: json['description'],
      types: List<String>.from(json['types']),
      formatted_address: json['formatted_address'],
      location: isRequired ? Location.fromJson(json['geometry']) : null,
    );
  }
}
