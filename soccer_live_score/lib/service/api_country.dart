import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soccer_live_score/model/country.dart';

class CountryApi {
  static const apiUrl = 'https://restcountries.com/v3.1/';

  static Future<List<Country>> getAllCountries() async {
    final String cUrl = apiUrl + 'all';
    var cRes = await http.get(Uri.parse(cUrl));
    var cJson = jsonDecode(cRes.body) as List<dynamic>;
    List<Country> countries =
        cJson.map((json) => Country.fromJson(json)).toList();
    return (countries);
  }

  static Future<Country> getCountry(String name) async {
    final String cUrl = apiUrl + 'name/$name';
    var cRes = await http.get(Uri.parse(cUrl));
    var cJson = jsonDecode(cRes.body);
    return (Country.fromJson(cJson[0]));
  }
}
