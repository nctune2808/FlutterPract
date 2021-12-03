import 'package:flutter/material.dart';
import 'package:soccer_live_score/model/player.dart';
import 'package:soccer_live_score/service/api_player.dart';
import 'package:soccer_live_score/src/player_detail_view.dart';
import 'package:soccer_live_score/src/player_view.dart';

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
                      child: PlayerView(
                        player: allPlayers[index],
                      ),
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
                // return ListView.builder(
                //     itemCount: allPlayers.length,
                //     itemBuilder: (context, index) {
                //       return Padding(
                //         padding: const EdgeInsets.symmetric(vertical: 10),
                //         child: Column(
                //           children: [
                //             Image.network(
                //               allPlayers[index].photo,
                //               height: 80,
                //             ),
                //             Text(allPlayers[index].name),
                //           ],
                //         ),
                //       );
                //     });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
