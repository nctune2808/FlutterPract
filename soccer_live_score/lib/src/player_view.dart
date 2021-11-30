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
                return GridView.builder(
                  itemCount: allPlayers.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Image.network(
                            allPlayers[index].photo,
                            height: 110,
                          ),
                          Text(
                            allPlayers[index].name,
                            maxLines: 1,
                          ),
                        ],
                      ),
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
