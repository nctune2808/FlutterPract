import 'package:flutter/material.dart';
import 'package:soccer_live_score/model/match.dart';
import 'package:soccer_live_score/service/api.dart';
import 'package:soccer_live_score/src/board_view.dart';
import 'package:soccer_live_score/src/team_view.dart';

class SoccerView extends StatefulWidget {
  const SoccerView({Key? key}) : super(key: key);

  @override
  _SoccerViewState createState() => _SoccerViewState();
}

class _SoccerViewState extends State<SoccerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Soccer Board',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFFFAFAFA),
      ),
      body: FutureBuilder(
          future: SoccerApi.getAllMatches(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Match> allMatches = snapshot.data as List<Match>;
              return ListView.builder(
                  itemCount: allMatches.length,
                  itemBuilder: (context, index) {
                    return BoardView(match: allMatches[index]);
                  });
              // Match currentMatch = allMatches[0];
              // return BoardView(
              //     expandedTime: currentMatch.fixture.status.elapsedTime,
              //     homeGoal: currentMatch.goal.home,
              //     awayGoal: currentMatch.goal.away);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
