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
            widget.player.photo,
            height: widget.moreDetails ? 200 : 100,
          ),
          SizedBox(height: 2),
          Text(
            widget.player.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          if (widget.moreDetails)
            Column(
              children: [
                Text('ID: ${widget.player.id}'),
                Text(widget.player.nationality),
                Text('Age: ${widget.player.age}'),
                Text('Height: ${widget.player.height}'),
                Text('Weight: ${widget.player.weight}'),
              ],
            )
        ],
      ),
    );
  }
}
