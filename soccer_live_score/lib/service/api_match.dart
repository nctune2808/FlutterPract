import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soccer_live_score/model/match.dart';

class MatchApi {
  static const apiUrl = 'https://v3.football.api-sports.io/fixtures?live=all';

  static const headers = {
    'x-rapidapi-key': '828693ac37bf972d1c1196a987882d87',
    'x-rapidapi-host': 'v3.football.api-sports.io'
  };

  static Future<List<Match>?> getAllMatches() async {
    final res = await http.get(Uri.parse(apiUrl), headers: headers);

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      print("Api service: $body");
      List<Match> matches =
          matchesList.map((item) => Match.fromJson(item)).toList();

      return matches;
    }

    return null;
  }
}
