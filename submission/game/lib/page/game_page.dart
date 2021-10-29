import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/component/board_builder.dart';
import 'package:game/component/rule_builder.dart';
import 'package:game/component/svg_builder.dart';
import 'package:game/model/item.dart';
import 'package:game/model/player.dart';
import 'package:game/page/rule_page.dart';
import 'package:game/page/stage_page.dart';
import 'package:game/route/router.dart';

class GamePage extends StatefulWidget {
  Player? player;
  GamePage({Key? key, this.player}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _sceneBuilder(),
      floatingActionButton: ruleBuilder(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _sceneBuilder() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          boardBuilder(value: widget.player!.total),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buttonBuilder(type: "paper"),
              _buttonBuilder(type: "scissors")
            ],
          ),
          _buttonBuilder(type: "rock")
        ],
      ),
    );
  }

  Widget _buttonBuilder({required String type}) {
    final item = Item(name: type, path: 'assets/images/icon-$type.svg');
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(shape: CircleBorder()),
        child: svgBuilder(type: type),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      StagePage(item: item, player: widget.player!)));
        },
      ),
    );
  }
}
