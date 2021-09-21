import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapi_flutter/models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    var queryParameters = {
      'q': city,
      'appid': '035ac371f9951c27c9439d372caebd61',
      'units': 'imperial'
    };
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);
    final response = await http.get(uri);

    print(response.body);

    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
