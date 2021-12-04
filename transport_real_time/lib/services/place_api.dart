import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:transport_real_time/models/location.dart';
import 'package:transport_real_time/models/place.dart';
import 'package:transport_real_time/models/place_autocomplete.dart';
import 'package:transport_real_time/models/place_detail.dart';
import 'package:transport_real_time/models/place_location.dart';
import 'package:transport_real_time/models/place_nearby.dart';
import 'package:transport_real_time/services/bus_api.dart';

class PlaceApi {
  final String key = 'AIzaSyAe0BUgZ5lEcPvy9PWkzFJCEbsNIcOeICI';

  // Future<String> getPlaceId(String input) async {
  //   final url =
  //       'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$key';
  //   var response = await http.get(
  //     Uri.parse(url),
  //   );

  //   var json = jsonDecode(response.body);

  //   var placeId = json['candidates'][0]['place_id'] as String;

  //   print(placeId);
  //   return placeId;
  // }

  Future<List<PlaceLocation>> getPlace(String input) async {
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

// 1
  Future<List<Place>> getPlaceAutocomplete(String input) async {
    final String aUrl =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&region=uk&key=${key}";

    var aRes = await http.get(Uri.parse(aUrl));
    var aJson = jsonDecode(aRes.body);
    List<dynamic> aTest = aJson['predictions'];

    return aTest.map((predict) => Place.fromJson(predict, false)).toList();
  }

// 2
  Future<Place> getPlaceDetail(String placeId) async {
    final String dUrl =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key";
    var dRes = await http.get(Uri.parse(dUrl));
    var dJson = jsonDecode(dRes.body);
    Map<String, dynamic> dTest = dJson['result'];
    return Place.fromJson(dTest, true);
  }

// 3
  Future<List<Place>> getPlaceNearby(Location location) async {
    final String nUrl =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${location.lat}%2C${location.lng}&type=bus_station&radius=500&key=$key";
    var nRes = await http.get(Uri.parse(nUrl));
    var nJson = jsonDecode(nRes.body);
    List<dynamic> nTest = nJson['results'];
    return nTest.map((place) => Place.fromJson(place, true)).toList();
  }
}
