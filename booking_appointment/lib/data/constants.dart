import 'package:flutter/material.dart';

import 'data.dart';
import 'time.dart';

const int maxNumber = 20;

List<Data> datas = [
  Data(
    title: 'Spa',
    staff: 'Staff 0',
    id: 0,
    time: TimeOfDay(hour: 9, minute: 40),
    d: 1,
  ),
  Data(
    title: 'Nails',
    staff: 'Staff 1',
    id: 1,
    time: TimeOfDay(hour: 10, minute: 15),
    d: 2,
  ),
  Data(
    title: 'Beauty',
    staff: 'Staff 2',
    id: 2,
    time: TimeOfDay(hour: 11, minute: 10),
    d: 3,
  ),
  Data(
    title: 'Hair',
    staff: 'Staff 3',
    id: 3,
    time: TimeOfDay(hour: 12, minute: 05),
    d: 4,
  ),
  Data(
    title: 'Massage',
    staff: 'Staff 4',
    id: 4,
    time: TimeOfDay(hour: 13, minute: 00),
    d: 5,
  ),
  Data(id: 5, d: 6, staff: 'staff', title: 'title', time: TimeOfDay(hour: 1, minute: 0)),
  Data(id: 5, d: 7, staff: 'staff', title: 'title', time: TimeOfDay(hour: 1, minute: 0)),
  Data(id: 5, d: 8, staff: 'staff', title: 'title', time: TimeOfDay(hour: 1, minute: 0)),
  Data(id: 5, d: 9, staff: 'staff', title: 'title', time: TimeOfDay(hour: 1, minute: 0)),
  Data(id: 5, d: 10, staff: 'staff', title: 'title', time: TimeOfDay(hour: 1, minute: 0)),
  Data(id: 5, d: 11, staff: 'staff', title: 'title', time: TimeOfDay(hour: 1, minute: 0)),
  Data(id: 5, d: 12, staff: 'staff', title: 'title', time: TimeOfDay(hour: 1, minute: 0)),
  Data(id: 5, d: 13, staff: 'staff', title: 'title', time: TimeOfDay(hour: 1, minute: 0)),
  Data(id: 5, d: 14, staff: 'staff', title: 'title', time: TimeOfDay(hour: 1, minute: 0)),
  Data(id: 5, d: 15, staff: 'staff', title: 'title', time: TimeOfDay(hour: 1, minute: 0)),
  Data(id: 5, d: 16, staff: 'staff', title: 'title', time: TimeOfDay(hour: 1, minute: 0)),
  Data(id: 5, d: 17, staff: 'staff', title: 'title', time: TimeOfDay(hour: 1, minute: 0)),
  Data(id: 5, d: 18, staff: 'staff', title: 'title', time: TimeOfDay(hour: 1, minute: 0)),
];
List<int> rangeTime = [
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22
];
List<Time> times = [
  // Time(hour: '0', time: '00:00'),
  // Time(hour: '1', time: '01:00'),
  // Time(hour: '2', time: '02:00'),
  // Time(hour: '3', time: '03:00'),
  // Time(hour: '4', time: '04:00'),
  // Time(hour: '5', time: '05:00'),
  // Time(hour: '6', time: '06:00'),
  // Time(hour: '7', time: '07:00'),
  // Time(
  //     hour: '08',
  //     duration: 60,
  //     start_time: TimeOfDay(hour: 8, minute: 00),
  //     end_time: TimeOfDay(hour: 9, minute: 00)),
  Time(hour: '9', duration: 60, start_time: '09:00', end_time: '10:00'),
  Time(hour: '10', duration: 60, start_time: '10:00', end_time: '11:00'),
  Time(hour: '11', duration: 60, start_time: '11:00', end_time: '12:00'),
  Time(hour: '12', duration: 60, start_time: '12:00', end_time: '13:00'),
  Time(hour: '13', duration: 60, start_time: '13:00', end_time: '14:00'),
  Time(hour: '14', duration: 60, start_time: '14:00', end_time: '15:00'),
  Time(hour: '15', duration: 60, start_time: '15:00', end_time: '16:00'),
  Time(hour: '16', duration: 60, start_time: '16:00', end_time: '17:00'),
  Time(hour: '17', duration: 60, start_time: '17:00', end_time: '18:00'),
  Time(hour: '18', duration: 60, start_time: '18:00', end_time: '19:00'),
  Time(hour: '19', duration: 60, start_time: '19:00', end_time: '20:00'),
  Time(hour: '20', duration: 60, start_time: '20:00', end_time: '21:00'),
  Time(hour: '21', duration: 60, start_time: '21:00', end_time: '22:00'),
  Time(hour: '22', duration: 60, start_time: '22:00', end_time: '23:00'),
  // Time(hour: '11', time: '23:00'),
];
