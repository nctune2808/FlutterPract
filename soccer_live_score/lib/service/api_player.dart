import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soccer_live_score/model/player.dart';

class PlayerApi {
  static const apiUrl =
      'https://v3.football.api-sports.io/players?team=85&season=2021';

  // static const key = "87a58cb23e77bac534b33a49f494863f";
  static const key = "828693ac37bf972d1c1196a987882d87";

  static const headers = {
    'x-rapidapi-key': key,
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
    final total = await totalPage();
    for (int i = 1; i <= total; i++) {
      var apiUrlPage = apiUrl + '&page=$i';
      // print(apiUrlPage);
      var res = await http.get(Uri.parse(apiUrlPage), headers: headers);
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);
        List<dynamic> playersList = body['response'];
        players += playersList.map((item) => Player.fromJson(item)).toList();
      }
    }

    return players;
  }
}
