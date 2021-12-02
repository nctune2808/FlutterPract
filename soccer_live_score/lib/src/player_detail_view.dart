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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Players")),
      body: Center(
        child: PlayerView(player: player, moreDetails: true),
      ),
    );
  }
}
