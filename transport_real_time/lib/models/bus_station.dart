import 'dart:convert';

import 'package:transport_real_time/models/bus_departure.dart';

class BusStation {
  String atcocode;
  String name;
  String? indicator;
  String? bearing;
  String? locality;
  List<BusDeparture>? departures;
  double? latitude;
  double? longitude;
  double? distance;

  BusStation({
    required this.atcocode,
    required this.name,
    this.indicator,
    this.bearing,
    this.locality,
    this.departures,
    this.latitude,
    this.longitude,
    this.distance,
  });

  factory BusStation.fromJson(
      Map<String, dynamic> json, List<BusDeparture>? departures) {
    return BusStation(
      atcocode: json['atcocode'],
      name: json['name'],
      indicator: json['indicator'],
      bearing: json['bearing'],
      locality: json['locality'],
      departures: departures,
      latitude: json['latitude'],
      longitude: json['longitude'],
      distance: json['distance'],
    );
  }

  @override
  String toString() {
    return 'BusStation(atcocode: $atcocode, name: $name, indicator: $indicator, bearing: $bearing, locality: $locality, departures: $departures, latitude: $latitude, longitude: $longitude, distance: $distance)';
  }
}
