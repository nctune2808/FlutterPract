import 'package:flutter/material.dart';

Map<String, int> decision({required String me, required String computer}) {
  List<Map<String, int>> vs = [
    {"DRAW": 0},
    {"WIN": 1},
    {"LOSE": -1}
  ];

  if (me == computer) return vs[0];
  if (me == "rock" && computer == "scissors") return vs[1];
  if (me == "paper" && computer == "rock") return vs[1];
  if (me == "scissors" && computer == "paper") return vs[1];
  return vs[2];
}

Widget boardBuilder({required int value}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      color: Colors.blue,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Text("Your Score:"), Text('${value}')],
      ),
    ),
  );
}
