import 'dart:convert';

class Page {
  int current;
  int total;

  Page({
    required this.current,
    required this.total,
  });

  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(
      current: json['current'],
      total: json['total'],
    );
  }
}
