import 'package:flutter/material.dart';
import 'package:soccer_live_score/model/team.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Team team = Team(
        id: 85,
        logoUrl: 'https://media.;api-sports.io/football/teams/85.png',
        name: 'PSG');

    FixedExtentScrollController fixedExtentScrollController =
        new FixedExtentScrollController();
    return Scaffold(
        appBar: AppBar(title: Text("Football Addicts")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _leagueBuilder(),
            _clubBuilder(),
          ],
        ));
  }

  Widget _leagueBuilder() {
    return Column(
      children: [
        Text("Select League", style: TextStyle(fontSize: 20)),
        Container(
          height: 100,
          color: Colors.grey,
          child: ListWheelScrollView(
            // controller: fixedExtentScrollController,
            physics: FixedExtentScrollPhysics(),
            squeeze: 2,
            itemExtent: 80,
            perspective: 0.01,
            diameterRatio: 1.5,
            // magnification: 1.5,
            // useMagnifier: true,
            children: [
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
            ],
            onSelectedItemChanged: (index) => {print(index)},
          ),
        ),
      ],
    );
  }

  Widget _clubBuilder() {
    return Column(
      children: [
        Text("Select Club", style: TextStyle(fontSize: 20)),
        Container(
          height: 100,
          color: Colors.grey,
          child: ListWheelScrollView(
            // controller: fixedExtentScrollController,
            physics: FixedExtentScrollPhysics(),
            squeeze: 2,
            itemExtent: 80,
            perspective: 0.01,
            diameterRatio: 1.5,
            // magnification: 1.5,
            // useMagnifier: true,
            children: [
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
              _scrollBuilder(),
            ],
            onSelectedItemChanged: (index) => {print(index)},
          ),
        ),
      ],
    );
  }

  Widget _scrollBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.ac_unit),
        Text("data"),
      ],
    );
  }
}
