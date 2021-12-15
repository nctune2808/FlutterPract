import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soccer_live_score/model/team.dart';

class TeamApi {
  static const apiUrl = 'https://v3.football.api-sports.io/teams';

  static const headers = {
    'x-rapidapi-key': '828693ac37bf972d1c1196a987882d87',
    'x-rapidapi-host': 'v3.football.api-sports.io'
  };

  static Future<void> getAllTeams() async {
    final res = await http.get(Uri.parse(apiUrl), headers: headers);

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body);
      List<dynamic> list = body['response'];
      List<Team> teams = list.map((json) => Team.fromJson(json['team'])).toList();
      print(teams);
    }
  }

  static Future<List<Team>> getTeams(int leagueId) async {
    final String tUrl = apiUrl + '?league=$leagueId&season=2021';
    var tRes = await http.get(Uri.parse(tUrl), headers: headers);
    var tJson = jsonDecode(tRes.body);
    List<dynamic> list = tJson['response'];
    List<Team> teams = list.map((json) => Team.fromJson(json['team'])).toList();
    // leagues.sort((a, b) => a.info.id.compareTo(b.info.id));
    return teams;
  }
}
