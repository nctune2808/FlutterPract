import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soccer_live_score/model/player.dart';

class PlayerApi {
  static var apiUrl =
      'https://v3.football.api-sports.io/players?team=85&season=2021';

  static const headers = {
    'x-rapidapi-key': '828693ac37bf972d1c1196a987882d87',
    'x-rapidapi-host': 'v3.football.api-sports.io'
  };

  static Future<int> totalPage() async {
    final res = await http.get(Uri.parse(apiUrl), headers: headers);

    if (res.statusCode == 200) {
      final body = jsonDecode(res.body);
      return body['paging']['total'];
    }
    return 0;
  }

  static Future<List<Player>?> getAllPlayers() async {
    List<Player> players = [];
    for (int i = 1; i < await totalPage(); i++) {
      apiUrl = apiUrl + '&page=$i';
      print(apiUrl);
      var res = await http.get(Uri.parse(apiUrl), headers: headers);
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);
        List<dynamic> playersList = body['response'];

        playersList.map((item) {
          Player player = Player.fromJson(item['player']);
          players.add(player);
        });
        // print("Api service: $body");

        // players.add(playersPerPage);
      }
    }

    return players;
  }
}
