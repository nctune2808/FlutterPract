import 'dart:convert';

class PlaceAutocomplete {
  String description;
  String place_id;

  PlaceAutocomplete({
    required this.description,
    required this.place_id,
  });

  factory PlaceAutocomplete.fromJson(Map<String, dynamic> json) {
    return PlaceAutocomplete(
      description: json['description'],
      place_id: json['place_id'],
    );
  }

  @override
  String toString() =>
      'PlaceAutocomplete(description: $description, place_id: $place_id)';
}

// https://maps.googleapis.com/maps/api/place/autocomplete/json?input=114-116&region=uk&key=AIzaSyAe0BUgZ5lEcPvy9PWkzFJCEbsNIcOeICI
