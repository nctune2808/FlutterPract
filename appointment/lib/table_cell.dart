import 'package:flutter/material.dart';

const double cellWidth = 55;

class MultiplicationTableCell extends StatelessWidget {
  final int? valuex;
  final int? valuey;
  final Color? color;

  MultiplicationTableCell(
    this.valuex,
    this.valuey,
    this.color,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cellWidth,
      height: cellWidth,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black12,
          width: 1.0,
        ),
      ),
      alignment: Alignment.center,
      child: ListTile(
        onTap: () => print("${valuex} and ${valuey}"),
        title: Text(
          '${valuey ?? ''}',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
