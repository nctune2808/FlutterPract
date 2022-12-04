import 'package:flutter/material.dart';

import 'package:booking_appointment/constants.dart';

import 'data.dart';
import 'time.dart';

const double cellWidth = 90;
const double cellHeight = 50;

class MultiplicationTableCell extends StatelessWidget {
  final int? x;
  final int? y;
  final Data? valuex;
  final Time? valuey;
  final Color? color;

  MultiplicationTableCell(
    this.x,
    this.y,
    this.valuex,
    this.valuey,
    this.color,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cellWidth,
      height: cellHeight * 2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black12,
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          _frameBuilder(at: '00'),
          _frameBuilder(at: '15'),
          _frameBuilder(at: '30'),
          _frameBuilder(at: '45')
        ],
      ),
    );
  }

  Widget _frameBuilder({required String at}) {
    bool isMatched = _checkMatch(at);
    return Expanded(
        flex: 2,
        child: GestureDetector(
          onTap: () {
            print(
                "staff ${valuex} in ${valuey!.hour} during ${(valuey!.duration / 4).toInt()}");
          },
          child: Container(
            width: cellWidth,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(
                color: Colors.black12,
                width: 0.25,
              ),
            ),
            child: Text(at),
          ),
        ));
  }

  bool _checkMatch(String at) {
    if (valuex?.time.hour.toString() == valuey?.hour) {
      return (valuex?.time.hour.toString() == valuey?.hour && valuex?.id == x);
    }
    return false;
  }
}
