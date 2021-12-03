import 'dart:convert';

class Goals {
  int? total;
  int? conceded; // null
  int? assists;
  int? saves;

  Goals({
    required this.total,
    required this.conceded,
    required this.assists,
    required this.saves,
  });

  factory Goals.fromJson(Map<String, dynamic> json) {
    return Goals(
      total: json['total'],
      conceded: json['conceded'],
      assists: json['assists'],
      saves: json['saves'],
    );
  }
}
