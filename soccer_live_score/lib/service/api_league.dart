import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soccer_live_score/model/league.dart';
import 'package:soccer_live_score/model/match.dart';

class LeagueApi {
  static const apiUrl = 'https://v3.football.api-sports.io/leagues';

  static const headers = {
    'x-rapidapi-key': '828693ac37bf972d1c1196a987882d87',
    'x-rapidapi-host': 'v3.football.api-sports.io'
  };

  static Future<void> getAllLeagues() async {
    final res = await http.get(Uri.parse(apiUrl), headers: headers);

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body);
      List<dynamic> list = body['response'];
      List<League> leagues = list.map((json) => League.fromJson(json)).toList();
    }
  }

  static Future<List<League>> getLeague(String name) async {
    final String lUrl = apiUrl + '?country=$name';
    var lRes = await http.get(Uri.parse(lUrl), headers: headers);
    var lJson = jsonDecode(lRes.body);
    List<dynamic> list = lJson['response'];
    List<League> leagues = list.map((json) => League.fromJson(json)).toList();
    leagues.sort((a, b) => a.info.id.compareTo(b.info.id));
    return leagues;
  }
}
