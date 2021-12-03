import 'package:flutter/material.dart';

import 'package:soccer_live_score/model/player.dart';
import 'package:soccer_live_score/src/player_view.dart';

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
        children: [
          PlayerView(player: player),
          Column(
            children: [
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
          Text('${stats.games.rating} *'),
        ],
      ),
    );
  }

  Widget _borderBuilder(String text, bool isBold) {
    Color color = Colors.black;
    switch (text) {
      case 'Attacker':
        color = Colors.red;
        break;
      // case '':
      // default:
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
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: color),
      padding: const EdgeInsets.all(8),
    );
  }
}
