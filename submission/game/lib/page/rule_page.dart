import 'package:flutter/material.dart';
import 'package:game/page/game_page.dart';
import 'package:game/route/router.dart';

class RulePage extends StatefulWidget {
  const RulePage({Key? key}) : super(key: key);

  @override
  _RulePageState createState() => _RulePageState();
}

class _RulePageState extends State<RulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _sceneBuilder(),
      floatingActionButton: _gameBuilder(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _sceneBuilder() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/design/original/mobile-rules-modal.jpg'),
        ),
      ),
    );
  }

  Widget _gameBuilder() {
    return FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: () {
          Navigator.popAndPushNamed(context, GAME_ROUTE);
        });
  }
}
