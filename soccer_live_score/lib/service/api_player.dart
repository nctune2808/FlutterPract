import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soccer_live_score/model/player.dart';

class PlayerApi {
  static const apiUrl = 'https://v3.football.api-sports.io/players';

  static const headers = {
    'x-rapidapi-key': '828693ac37bf972d1c1196a987882d87',
    'x-rapidapi-host': 'v3.football.api-sports.io'
  };

  static Future<List<Player>?> getAllPlayers() async {
    final res = await http.get(Uri.parse(apiUrl), headers: headers);

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body);
      List<dynamic> playersList = body['response'];
      print("Api service: $body");
      List<Player> players =
          playersList.map((item) => Player.fromJson(item)).toList();

      return players;
    }

    return null;
  }
}
