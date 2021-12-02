import 'package:flutter/material.dart';

import 'package:soccer_live_score/model/player.dart';
import 'package:soccer_live_score/service/api_player.dart';

class PlayerView extends StatefulWidget {
  Player player;
  bool moreDetails;
  PlayerView({
    Key? key,
    required this.player,
    required this.moreDetails,
  }) : super(key: key);

  @override
  _PlayerViewState createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            widget.player.playerInfos.photo,
            height: widget.moreDetails ? 200 : 100,
          ),
          SizedBox(height: 2),
          Text(
            widget.player.playerInfos.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          if (widget.moreDetails)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(widget.player.playerStats.games.position),
                    Text('${widget.player.playerStats.games.rating}'),
                    Text('Sub-in: ${widget.player.playerStats.subtitutes.sin}'),
                    Text(
                        'Sub-out: ${widget.player.playerStats.subtitutes.sout}'),
                    Text(
                        'Bench: ${widget.player.playerStats.subtitutes.bench}'),
                  ],
                ),
                Column(
                  children: [
                    Text('ID: ${widget.player.playerInfos.id}'),
                    Text(widget.player.playerInfos.nationality),
                    Text('Age: ${widget.player.playerInfos.age}'),
                    Text('Height: ${widget.player.playerInfos.height}'),
                    Text('Weight: ${widget.player.playerInfos.weight}'),
                  ],
                ),
              ],
            )
        ],
      ),
    );
  }
}
