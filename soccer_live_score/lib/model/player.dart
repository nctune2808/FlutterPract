import 'dart:convert';

import 'package:soccer_live_score/model/league.dart';
import 'package:soccer_live_score/model/statistics/cards.dart';
import 'package:soccer_live_score/model/statistics/dribbles.dart';
import 'package:soccer_live_score/model/statistics/games.dart';
import 'package:soccer_live_score/model/statistics/goals.dart';
import 'package:soccer_live_score/model/statistics/passes.dart';
import 'package:soccer_live_score/model/statistics/shots.dart';
import 'package:soccer_live_score/model/statistics/substitutes.dart';
import 'package:soccer_live_score/model/statistics/tackles.dart';
import 'package:soccer_live_score/model/team.dart';

class Player {
  PlayerInfos playerInfos;
  PlayerStats playerStats;

  Player({required this.playerInfos, required this.playerStats});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      playerInfos: PlayerInfos.fromJson(json['player']),
      playerStats: PlayerStats.fromJson(json['statistics'][0]),
    );
  }
}

class PlayerInfos {
  int id;
  String name;
  String firstname;
  String lastname;
  int age;
  String nationality;
  String? height;
  String? weight;
  String photo;

  PlayerInfos({
    required this.id,
    required this.name,
    required this.firstname,
    required this.lastname,
    required this.age,
    required this.nationality,
    required this.height,
    required this.weight,
    required this.photo,
  });

  factory PlayerInfos.fromJson(Map<String, dynamic> json) {
    return PlayerInfos(
      id: json['id'],
      name: json['name'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      age: json['age'],
      nationality: json['nationality'],
      height: json['height'],
      weight: json['weight'],
      photo: json['photo'],
    );
  }
}

class PlayerStats {
  Team team;
  League league;
  Games games;
  Subtitutes subtitutes;
  Cards cards;
  Shots shots;
  Passes passes;
  Tackles tackles;
  Dribbles dribbles;
  Goals goals;

  PlayerStats({
    required this.team,
    required this.league,
    required this.games,
    required this.subtitutes,
    required this.cards,
    required this.shots,
    required this.passes,
    required this.tackles,
    required this.dribbles,
    required this.goals,
  });

  factory PlayerStats.fromJson(Map<String, dynamic> json) {
    return PlayerStats(
      games: Games.fromJson(json['games']),
      subtitutes: Subtitutes.fromJson(json['substitutes']),
      cards: Cards.fromJson(json['cards']),
      shots: Shots.fromJson(json['shots']),
      passes: Passes.fromJson(json['passes']),
      tackles: Tackles.fromJson(json['tackles']),
      dribbles: Dribbles.fromJson(json['dribbles']),
      goals: Goals.fromJson(json['goals']),
      league: League.fromJson(json['league']),
      team: Team.fromJson(json['team']),
    );
  }
}
