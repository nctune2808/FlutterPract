import 'package:flutter/material.dart';
import 'package:game/component/board_builder.dart';
import 'package:game/component/rule_builder.dart';
import 'package:game/component/svg_builder.dart';
import 'package:game/model/item.dart';
import 'package:game/model/player.dart';
import 'package:game/page/game_page.dart';
import 'package:game/route/router.dart';

class StagePage extends StatefulWidget {
  Item item;
  Player player;
  StagePage({
    Key? key,
    required this.item,
    required this.player,
  }) : super(key: key);

  @override
  _StagePageState createState() => _StagePageState();
}

class _StagePageState extends State<StagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _sceneBuilder(),
      floatingActionButton: ruleBuilder(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _sceneBuilder() {
    final String com = computerSelection();
    final int result =
        decision(me: widget.item.name!, computer: com).values.single;
    print("result $result");
    setState(() {
      widget.player.total += result;
    });

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          boardBuilder(value: widget.player.total),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(children: [
                Text("Me"),
                svgBuilder(type: widget.item.name!),
              ]),
              Column(children: [
                Text("Computer"),
                svgBuilder(type: com),
              ]),
            ],
          ),
          Text(
            decision(me: widget.item.name!, computer: com).keys.single,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
              onPressed: () async {
                // print(widget.player.total);
                // Navigator.pop(context);
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => GamePage(player: widget.player)));
              },
              child: Text("Play Again"))
        ],
      ),
    );
  }

  String computerSelection() {
    List<String> item = ['rock', 'paper', 'scissors'];
    var rand = (item..shuffle()).first;
    return rand;
  }
}
