class Location {
  double lat;
  double lng;

  Location({
    required this.lat,
    required this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['location']['lat'],
      lng: json['location']['lng'],
    );
  }

  @override
  String toString() => 'Location(lat: $lat, lng: $lng)';
}
