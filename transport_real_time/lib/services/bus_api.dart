import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:transport_real_time/models/bus_departure.dart';
import 'package:transport_real_time/models/bus_station.dart';

class BusApi {
  // static const headers = {
  //   'app_id': "cc839168",
  //   'app_key': "4a88f7c18fd623a4049080ece77ce0c6",
  // };

  static Future<BusStation> getBusStationByAtcocode(String atco) async {
    var atcoUrl = "https://transportapi.com/v3/uk/bus/stop/$atco/live.json" +
        "?app_id=cc839168" +
        "&app_key=4a88f7c18fd623a4049080ece77ce0c6" +
        "&group=route" +
        "&nextbuses=yes";

    final res = await http.get(Uri.parse(atcoUrl));

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

  static Future<List<BusStation>> getBusStationByGeo(
      String lat, String lon) async {
    var geoUrl = "http://transportapi.com/v3/uk/places.json" +
        "?lat=$lat" +
        "&lon=$lon" +
        "&type=bus_stop" +
        "&app_id=cc839168" +
        "&app_key=4a88f7c18fd623a4049080ece77ce0c6";

    final res = await http.get(Uri.parse(geoUrl));

    final body = jsonDecode(res.body);

    List<dynamic> busStationList = body['member'];
    // Map<String, dynamic> busMembers = body['member'];

    // print(busStationList);

    // return BusStation.fromJson(busStationList[0], null);

    return busStationList
        .map((item) => BusStation.fromJson(item, null))
        .toList();
  }
}
