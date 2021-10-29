import 'package:flutter/material.dart';
import 'package:game/page/game_page.dart';
import 'package:game/page/rule_page.dart';

const GAME_ROUTE = "/game";
const RULE_ROUTE = "/rule";

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case GAME_ROUTE:
        return MaterialPageRoute(builder: (_) => GamePage());
      case RULE_ROUTE:
        return MaterialPageRoute(builder: (_) => RulePage());
    }
  }
}
