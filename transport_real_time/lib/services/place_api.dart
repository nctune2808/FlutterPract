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

  Future<List<PlaceLocation>> getPlace(String input) async {
    // final String url =
    //     "https://maps.googleapis.com/maps/api/place/nearbysearch/json?" +
    //         "location=51.5493599%2C-0.0753006" +
    //         "&type=bus_station" +
    //         "&radius=500" +
    //         "&key=${key}";

    final String url =
        "https://maps.googleapis.com/maps/api/place/textsearch/json" +
            // "?location=51.5493599%2C-0.0753006" +
            "?query=${input}" +
            "&region=uk" +
            "&key=${key}";

    var response = await http.get(Uri.parse(url));

    var body = jsonDecode(response.body);

    List<dynamic> results = body['results'];
    return results
        .map((place) => PlaceLocation.fromJson(place['geometry']['location']))
        .toList();
  }
}
