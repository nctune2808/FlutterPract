import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soccer_live_score/function/covert.dart';

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
    // yyyy-MM-dd'T'HH:mm:ssZ
    // 2021-11-28T23:00:00+00:00
    String date = readTime(
        DateFormat("yyyy-MM-dd'T'HH:mm:ssZ").parse(match.fixture.date));
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("${match.league.name} - ${date}"),
        Text(
          "${match.fixture.status.elapsedTime}\"",
          style: const TextStyle(
            fontSize: 15,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
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
            ]),
        Text("Stadium:  ${match.fixture.venue.name}"),
        const Divider(),
      ],
    );
  }
}
