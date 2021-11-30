import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:transport_real_time/models/bus_departure.dart';
import 'package:transport_real_time/models/bus_station.dart';

class BusApi {
  static var apiUrl =
      "https://transportapi.com/v3/uk/bus/stop/490005945M/live.json?app_id=cc839168&app_key=4a88f7c18fd623a4049080ece77ce0c6&group=route&nextbuses=yes";

  static Future<BusStation> getBusStation() async {
    final res = await http.get(Uri.parse(apiUrl));

    final body = jsonDecode(res.body);

    Map<String, dynamic> busStationMap = body;
    Map<String, dynamic> busDepartures = body['departures'];

    List<BusDeparture> departures = [];
    for (String key in busDepartures.keys) {
      List<dynamic> busList = body['departures'][key];
      departures += busList.map((item) => BusDeparture.fromJson(item)).toList();
      departures.sort((a, b) =>
          (a.best_departure_estimate).compareTo(b.best_departure_estimate));
    }

    return BusStation.fromJson(busStationMap, departures);
  }
}
