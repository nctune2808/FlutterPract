import 'dart:convert';

class Subtitutes {
  int? sin;
  int? sout;
  int? bench;

  Subtitutes({
    required this.sin,
    required this.sout,
    required this.bench,
  });

  factory Subtitutes.fromJson(Map<String, dynamic> json) {
    return Subtitutes(
      sin: json['in'],
      sout: json['out'],
      bench: json['bench'],
    );
  }
}
