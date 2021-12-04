import 'package:flutter/material.dart';

import 'package:soccer_live_score/model/player.dart';

class PlayerDetailView extends StatelessWidget {
  Player player;

  PlayerDetailView({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlayerStats stats = player.playerStats;
    PlayerInfos infos = player.playerInfos;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Players")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Text(
              '${player.playerInfos.name} (${player.playerInfos.lastname})',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Row(
            children: [
              Image.network(
                player.playerInfos.photo,
                height: 180,
              ),
              Expanded(
                child: Column(
                  children: [
                    // _rowBuilder(Icon(Icons.login), "abc"),
                    // _rowBuilder(Icon(Icons.logout), "abc"),
                    // _rowBuilder(Icon(Icons.sports_soccer), "abcdddd"),

                    _borderBuilder(
                      stats.games.position,
                      false,
                    ),
                    Text(infos.nationality),
                    Text('Age: ${infos.age}'),
                    Text('Height: ${infos.height}'),
                    Text('Weight: ${infos.weight}'),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('Sub-in: ${stats.subtitutes.sin}'),
                  Text('Sub-out: ${stats.subtitutes.sout}'),
                  Text('Bench: ${stats.subtitutes.bench}'),
                  Text('Yellow: ${stats.cards.yellow}'),
                  Text('Red: ${stats.cards.red}'),
                ],
              ),
              Column(
                children: [
                  Text("Assit: ${stats.goals.assists}"),
                  Text("Goal: ${stats.goals.total}"),
                  Text("Shot: ${stats.shots.on} / ${stats.shots.total}"),
                  Text(
                      "Tackle: ${stats.tackles.interceptions} / ${stats.tackles.total}"),
                  Text(
                      "Dribble: ${stats.dribbles.success} / ${stats.dribbles.attempts}"),
                  Text(
                      "Pass: ${stats.passes.total} - ${stats.passes.accuracy}%"),
                ],
              ),
            ],
          ),
          _rowBuilder(
              Icon(Icons.star, color: Colors.yellow), '${stats.games.rating}'),
        ],
      ),
    );
  }

  Widget _rowBuilder(Icon icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icon,
        SizedBox(width: 20),
        Text(text),
      ],
    );
  }

  Widget _borderBuilder(String text, bool isBold) {
    Color color = Colors.lightGreen;
    switch (text) {
      case 'Attacker':
        color = Colors.red;
        break;

      case 'Midfielder':
        color = Colors.orangeAccent;
        break;

      case 'Defender':
        color = Colors.lightBlue;
        break;
    }
    return Container(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: color),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10));
  }
}
