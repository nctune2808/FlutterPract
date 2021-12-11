import 'dart:convert';

class League {
  // dynamic season;
  // String? round;
  LeagueInfo info;
  LeagueCountry country;

  League({
    required this.info,
    required this.country,
    // this.season,
    // this.round,
  });

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      info: LeagueInfo.fromJson(json['league']),
      country: LeagueCountry.fromJson(json['country']),
      // season: json['season'],
      // round: json['round'],
    );
  }
}

class LeagueInfo {
  int id;
  String name;
  String? logo;

  LeagueInfo({required this.id, required this.name, this.logo});

  factory LeagueInfo.fromJson(Map<String, dynamic> json) {
    return LeagueInfo(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
    );
  }
}

class LeagueCountry {
  String name;
  String? code;
  String? flag;

  LeagueCountry({required this.name, this.code, this.flag});

  factory LeagueCountry.fromJson(Map<String, dynamic> json) {
    return LeagueCountry(
      name: json['name'],
      code: json['code'],
      flag: json['flag'],
    );
  }
}
