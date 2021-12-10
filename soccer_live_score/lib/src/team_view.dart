import 'package:flutter/material.dart';

import 'package:soccer_live_score/model/team.dart';

class TeamView extends StatelessWidget {
  Team team;

  TeamView({
    Key? key,
    required this.team,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          team.logoUrl,
          width: 60,
        ),
        const SizedBox(height: 10),
        Text(
          team.name,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
