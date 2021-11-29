import 'package:soccer_live_score/model/fixture.dart';
import 'package:soccer_live_score/model/goal.dart';
import 'package:soccer_live_score/model/league.dart';
import 'package:soccer_live_score/model/team.dart';

class Match {
  Fixture fixture;
  Team home;
  Team away;
  Goal goal;
  League league;

  Match({
    required this.fixture,
    required this.home,
    required this.away,
    required this.goal,
    required this.league,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      fixture: Fixture.fromJson(json['fixture']),
      home: Team.fromJson(json['teams']['home']),
      away: Team.fromJson(json['teams']['away']),
      goal: Goal.fromJson(json['goals']),
      league: League.fromJson(json['league']),
    );
  }
}
