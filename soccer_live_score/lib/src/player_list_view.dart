import 'package:flutter/material.dart';
import 'package:soccer_live_score/model/player.dart';
import 'package:soccer_live_score/service/api_player.dart';
import 'package:soccer_live_score/src/player_detail_view.dart';

class PlayerListView extends StatelessWidget {
  const PlayerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Players")),
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: PlayerApi.getAllPlayers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Player> allPlayers = snapshot.data as List<Player>;
                return GridView.builder(
                  itemCount: allPlayers.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: PlayerView(allPlayers[index]),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => PlayerDetailView(
                                      player: allPlayers[index],
                                    )));
                      },
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }

  Widget PlayerView(Player player) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            player.playerInfos.photo,
            height: 100,
          ),
          SizedBox(height: 2),
          Text(
            player.playerInfos.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
