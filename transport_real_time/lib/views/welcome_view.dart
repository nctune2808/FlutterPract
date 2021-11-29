import 'package:flutter/material.dart';
import 'package:transport_real_time/models/bus_station.dart';
import 'package:transport_real_time/services/bus_api.dart';
import 'package:transport_real_time/views/bus/departure_view.dart';
import 'package:transport_real_time/views/bus/station_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Transport"),
        ),
        body: FutureBuilder(
          future: BusApi.getBusStation(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              BusStation busStation = snapshot.data as BusStation;

              return Column(
                children: [
                  BusStationView(busStation: busStation),
                  BusDepartureView(
                    departures: busStation.departures,
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
