import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget svgBuilder({required String type}) {
  return Container(
    width: 100,
    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[200]),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        SvgPicture.asset(
          'assets/images/icon-$type.svg',
          height: 60,
        ),
        Text(
          type.toUpperCase(),
          style: TextStyle(fontSize: 10, color: Colors.black),
        )
      ]),
    ),
  );
  // return SvgPicture.asset('assets/images/icon-$type.svg', height: 60);
}
