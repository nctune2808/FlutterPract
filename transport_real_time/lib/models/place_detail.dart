import 'dart:convert';

class PlaceDetail {
  // inside result map object
  String name;
  String place_id;
  String formatted_address;
  List<String> types;
  double lat;
  double lng;

  PlaceDetail({
    required this.name,
    required this.place_id,
    required this.formatted_address,
    required this.types,
    required this.lat,
    required this.lng,
  });

  factory PlaceDetail.fromJson(Map<String, dynamic> json) {
    return PlaceDetail(
      name: json['name'],
      place_id: json['place_id'],
      formatted_address: json['formatted_address'],
      types: List<String>.from(json['types']),
      lat: json['geometry']['location']['lat'],
      lng: json['geometry']['location']['lng'],
    );
  }

  @override
  String toString() {
    return 'PlaceDetail(name: $name, place_id: $place_id, formatted_address: $formatted_address, types: $types, lat: $lat, lng: $lng)';
  }
}

// https://maps.googleapis.com/maps/api/place/details/json?place_id=ChIJL7HHt88ddkgRlewKhcut4Qs&key=AIzaSyAe0BUgZ5lEcPvy9PWkzFJCEbsNIcOeICI
