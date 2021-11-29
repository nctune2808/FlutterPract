import 'package:flutter/material.dart';
import 'package:soccer_live_score/model/player.dart';
import 'package:soccer_live_score/service/api_player.dart';

class PlayerView extends StatelessWidget {
  const PlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Players")),
        body: FutureBuilder(
            future: PlayerApi.getAllPlayers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Player> allPlayers = snapshot.data as List<Player>;
                return Text("data");
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
