import 'dart:convert';

class Cards {
  int? yellow;
  int? yellowred;
  int? red;

  Cards({
    required this.yellow,
    required this.yellowred,
    required this.red,
  });

  factory Cards.fromJson(Map<String, dynamic> json) {
    return Cards(
      yellow: json['yellow'],
      yellowred: json['yellowred'],
      red: json['red'],
    );
  }
}
