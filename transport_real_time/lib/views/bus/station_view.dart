import 'package:flutter/material.dart';

import 'package:transport_real_time/models/bus_station.dart';

class BusStationView extends StatelessWidget {
  BusStation busStation;
  BusStationView({
    Key? key,
    required this.busStation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          busStation.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          busStation.locality,
          style: const TextStyle(
            fontSize: 15,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
