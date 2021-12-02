import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:transport_real_time/models/place_location.dart';
import 'package:transport_real_time/services/bus_api.dart';

class PlaceApi {
  final String key = 'AIzaSyAe0BUgZ5lEcPvy9PWkzFJCEbsNIcOeICI';
  static const headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Credentials': 'true',
    'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
    'Access-Control-Allow-Headers':
        'Origin, X-Requested-With, Content-Type, Accept',
  };

  Future<String> getPlaceId(String input) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';
    var response = await http.get(
      Uri.parse(url),
    );

    var json = jsonDecode(response.body);

    var placeId = json['candidates'][0]['place_id'] as String;

    print(placeId);
    return placeId;
  }

  Future<PlaceLocation> getPlace(String input) async {
    final placeId = await getPlaceId(input);

    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';

    var response = await http.get(Uri.parse(url));

    var body = jsonDecode(response.body);

    Map<String, dynamic> placeResult = body['result']['geometry']['location'];
    PlaceLocation placeLocation = PlaceLocation.fromJson(placeResult);
    BusApi.getBusStationByGeo(
        placeLocation.lat.toString(), placeLocation.lng.toString());

    return placeLocation;
  }
}
