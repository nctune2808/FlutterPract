import 'dart:convert';

class Tackles {
  int total;
  int blocks;
  int interceptions;

  Tackles({
    required this.total,
    required this.blocks,
    required this.interceptions,
  });

  factory Tackles.fromJson(Map<String, dynamic> json) {
    return Tackles(
      total: json['total'],
      blocks: json['blocks'],
      interceptions: json['interceptions'],
    );
  }
}
