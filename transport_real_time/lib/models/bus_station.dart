import 'dart:convert';

import 'package:transport_real_time/models/bus_departure.dart';

class BusStation {
  String atcocode;
  String name;
  String indicator;
  String bearing;
  String locality;
  List<BusDeparture> departures;

  BusStation({
    required this.atcocode,
    required this.name,
    required this.indicator,
    required this.bearing,
    required this.locality,
    required this.departures,
  });

  factory BusStation.fromJson(
      Map<String, dynamic> json, List<BusDeparture> departures) {
    return BusStation(
      atcocode: json['atcocode'],
      name: json['name'],
      indicator: json['indicator'],
      bearing: json['bearing'],
      locality: json['locality'],
      departures: departures,
    );
  }
}
