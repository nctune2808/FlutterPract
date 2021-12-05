import 'dart:convert';

class Country {
  String name;
  String code;
  String flag;

  Country({
    required this.name,
    required this.code,
    required this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      code: json['code'],
      flag: json['flag'],
    );
  }
}
