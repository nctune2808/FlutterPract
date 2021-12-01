import 'package:flutter/material.dart';
import 'package:transport_real_time/models/bus_station.dart';

import 'package:transport_real_time/services/bus_api.dart';
import 'package:transport_real_time/views/bus/bus_departures_view.dart';

class BusStationsView extends StatefulWidget {
  double lat;
  double lng;

  BusStationsView({
    Key? key,
    required this.lat,
    required this.lng,
  }) : super(key: key);

  @override
  _BusStationsViewState createState() => _BusStationsViewState();
}

class _BusStationsViewState extends State<BusStationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bus Stations")),
      body: FutureBuilder(
        future: BusApi.getBusStationByGeo(
            widget.lat.toString(), widget.lng.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<BusStation> busStationList = snapshot.data as List<BusStation>;
            return ListView.builder(
              itemCount: busStationList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Column(
                    children: [
                      Text(busStationList[index].name),
                      Text(
                          '${busStationList[index].latitude} : ${busStationList[index].longitude}'),
                      Text(busStationList[index].atcocode),
                      Text('${busStationList[index].distance}'),
                      Divider()
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => BusDepaturesView(
                                atco: busStationList[index].atcocode)));
                  },
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
