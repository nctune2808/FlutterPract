import 'dart:convert';

import 'package:soccer_live_score/model/statistics/cards.dart';
import 'package:soccer_live_score/model/statistics/games.dart';
import 'package:soccer_live_score/model/statistics/substitutes.dart';

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
  Games games;
  Subtitutes subtitutes;
  Cards cards;

  PlayerStats({
    required this.games,
    required this.subtitutes,
    required this.cards,
  });

  factory PlayerStats.fromJson(Map<String, dynamic> json) {
    return PlayerStats(
      games: Games.fromJson(json['games']),
      subtitutes: Subtitutes.fromJson(json['substitutes']),
      cards: Cards.fromJson(json['cards']),
    );
  }
}
