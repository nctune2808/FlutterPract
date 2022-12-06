import 'package:flutter/material.dart';

import 'time.dart';

class Data {
  int id;
  double d;
  String staff;
  String title;
  TimeOfDay time;

  Data({
    required this.id,
    required this.d,
    required this.staff,
    required this.title,
    required this.time,
  });
}
