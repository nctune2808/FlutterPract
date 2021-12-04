import 'dart:convert';

class PlaceNearby {
  // inside results array
  String name;
  List<String> types;
  String place_id;
  double lat;
  double lng;

  PlaceNearby({
    required this.name,
    required this.types,
    required this.place_id,
    required this.lat,
    required this.lng,
  });

  factory PlaceNearby.fromJson(Map<String, dynamic> json) {
    return PlaceNearby(
      name: json['name'],
      types: List<String>.from(json['types']),
      place_id: json['place_id'],
      lat: json['geometry']['location']['lat'],
      lng: json['geometry']['location']['lng'],
    );
  }

  @override
  String toString() {
    return 'PlaceNearby(name: $name, types: $types, place_id: $place_id, lat: $lat, lng: $lng)';
  }
}

// https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=51.5493599%2C-0.0753006&type=bus_station&radius=500&key=AIzaSyAe0BUgZ5lEcPvy9PWkzFJCEbsNIcOeICI
