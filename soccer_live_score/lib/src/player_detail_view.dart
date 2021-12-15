import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:soccer_live_score/model/country.dart';

import 'package:soccer_live_score/model/player.dart';
import 'package:soccer_live_score/service/api_country.dart';

class PlayerDetailView extends StatefulWidget {
  Player player;

  PlayerDetailView({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  _PlayerDetailViewState createState() => _PlayerDetailViewState();
}

class _PlayerDetailViewState extends State<PlayerDetailView> {
  late PlayerStats stats;
  late PlayerInfos infos;
  var flag = "";

  void _getCountryFlag(String name) async {
    final getFlag = (await CountryApi.getCountry(name)).flag;
    setState(() {
      flag = getFlag;
    });
  }

  @override
  void initState() {
    super.initState();
    stats = widget.player.playerStats;
    infos = widget.player.playerInfos;
    _getCountryFlag(infos.nationality);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Players")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(
              '${infos.name} (${infos.lastname})',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                stats.team.logoUrl!,
                height: 80,
                width: 80,
              ),
              Image.network(
                infos.photo,
                height: 150,
              ),
              flag.isNotEmpty
                  ? Image.network(flag, width: 80)
                  : SizedBox(width: 80),
            ],
          ),
          GridView(
            shrinkWrap: true,
            padding: EdgeInsets.all(20),
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 20, mainAxisSpacing: 20),
            children: [
              _leftPane(),
              _centerPane(),
              _rightPane(),
            ],
          ),
          _rowBuilder(
              Icon(Icons.star, color: Colors.yellow), '${stats.games.rating}'),
        ],
      ),
    );
  }

  Widget _rowBuilder(Icon icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icon,
        SizedBox(width: 20),
        Text(text),
      ],
    );
  }

  Widget _leftPane() {
    return Column(
      children: [
        Text('Sub-in: ${stats.subtitutes.sin}'),
        Text('Sub-out: ${stats.subtitutes.sout}'),
        Text('Bench: ${stats.subtitutes.bench}'),
        Text('Yellow: ${stats.cards.yellow}'),
        Text('Red: ${stats.cards.red}'),
      ],
    );
  }

  Widget _rightPane() {
    return Column(
      children: [
        Text("Assit: ${stats.goals.assists}"),
        Text("Goal: ${stats.goals.total}"),
        Text("Shot: ${stats.shots.on} / ${stats.shots.total}"),
        Text("Tackle: ${stats.tackles.interceptions} / ${stats.tackles.total}"),
        Text("Dribble: ${stats.dribbles.success} / ${stats.dribbles.attempts}"),
        Text("Pass: ${stats.passes.total} - ${stats.passes.accuracy}%"),
      ],
    );
  }

  Widget _centerPane() {
    return Column(
      children: [
        // _rowBuilder(Icon(Icons.login), "abc"),
        // _rowBuilder(Icon(Icons.logout), "abc"),
        // _rowBuilder(Icon(Icons.sports_soccer), "abcdddd"),

        _borderBuilder(stats.games.position, false),

        Text('Age: ${infos.age}'),
        Text('Height: ${infos.height}'),
        Text('Weight: ${infos.weight}'),
      ],
    );
  }

  Widget _borderBuilder(String text, bool isBold) {
    Color color = Colors.lightGreen;
    switch (text) {
      case 'Attacker':
        color = Colors.red;
        break;

      case 'Midfielder':
        color = Colors.orangeAccent;
        break;

      case 'Defender':
        color = Colors.lightBlue;
        break;
    }
    return Container(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: color),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10));
  }
}
