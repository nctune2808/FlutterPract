import 'package:flutter/material.dart';

import 'package:soccer_live_score/model/match.dart';
import 'package:soccer_live_score/src/team_view.dart';

class BoardView extends StatelessWidget {
  Match match;

  BoardView({
    Key? key,
    required this.match,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${match.fixture.status.elapsedTime}\"",
            style: const TextStyle(
              fontSize: 15,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TeamView(team: match.home),
              Text(
                "${match.goal.home} - ${match.goal.away}",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TeamView(team: match.away),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
