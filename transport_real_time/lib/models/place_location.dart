class PlaceLocation {
  double lat;
  double lng;

  PlaceLocation({
    required this.lat,
    required this.lng,
  });

  factory PlaceLocation.fromJson(Map<String, dynamic> json) {
    return PlaceLocation(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  @override
  String toString() => 'PlaceLocation(lat: $lat, lng: $lng)';
}
