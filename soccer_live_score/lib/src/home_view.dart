import 'package:flutter/material.dart';

import 'package:soccer_live_score/model/team.dart';
import 'package:soccer_live_score/src/match_view.dart';
import 'package:soccer_live_score/src/player_list_view.dart';
import 'package:soccer_live_score/src/team_view.dart';

class HomeView extends StatelessWidget {
  Team team;

  HomeView({
    Key? key,
    required this.team,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LeagueApi.getAllLeagues();
    return Scaffold(
      appBar: AppBar(title: Text(team.name!)),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            // height: 100,
            child: TeamView(team: team),
          ),
          GridView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20),
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 20, mainAxisSpacing: 20),
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PlayerListView()));
                  },
                  child: Text("All Players")),
              ElevatedButton(onPressed: () {}, child: Text("List Squads")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => MatchView()));
                  },
                  child: Text("Live Score"))
            ],
          ),
        ],
      ),
    );
  }
}
