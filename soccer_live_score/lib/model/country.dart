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
      name: json['name']['common'],
      code: json['cca2'],
      flag: json['flags']['svg'],
    );
  }

  @override
  String toString() => 'Country(name: $name, code: $code, flag: $flag)';
}
