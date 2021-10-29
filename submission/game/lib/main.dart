import 'package:flutter/material.dart';
import 'package:game/model/player.dart';
import 'package:game/page/game_page.dart';
import 'package:game/route/router.dart';

void main() {
  runApp(MyApp(router: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter? router;
  MyApp({Key? key, this.router}) : super(key: key);
  Player player = Player(name: "Hello", total: 0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RPS game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GamePage(player: player),
      onGenerateRoute: router!.generateRoute,
    );
  }
}
