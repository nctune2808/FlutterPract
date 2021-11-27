import 'package:flutter/material.dart';

class BoardView extends StatelessWidget {
  int expandedTime;
  int homeGoal;
  int awayGoal;

  BoardView({
    Key? key,
    required this.expandedTime,
    required this.homeGoal,
    required this.awayGoal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("test"), Text("${homeGoal} - ${awayGoal}")],
    );
  }
}
