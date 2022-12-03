import 'package:flutter/material.dart';

import 'time.dart';

class Data {
  int id;
  String staff;
  String title;
  TimeOfDay time;
  Data({
    required this.id,
    required this.staff,
    required this.title,
    required this.time,
  });
}
