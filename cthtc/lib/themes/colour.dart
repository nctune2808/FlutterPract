import 'package:flutter/material.dart';

const GoldenColour = const Color(0x0FFEEBC1D);
const DarkenColour = Colors.black;

const PrimaryColor = const Color(0x0FFEEBC1D);
const PrimaryColorLight = const Color(0xFFFFD700);
const PrimaryColorDark = const Color(0xFFEBB40F);

const SecondaryColor = const Color(0xFFb2dfdb);
const SecondaryColorLight = const Color(0xFFe5ffff);
const SecondaryColorDark = const Color(0xFF82ada9);

const Background = const Color(0xFFfffdf7);
const TextColor = const Color(0xFFffffff);

class MyTheme {
  static final ThemeData defaultTheme = _buildMyTheme();

  static ThemeData _buildMyTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      primaryColor: PrimaryColorLight,
      primaryColorDark: PrimaryColorDark,
      primaryColorLight: PrimaryColorLight,
      appBarTheme: const AppBarTheme(
        backgroundColor: PrimaryColorLight,
        foregroundColor: DarkenColour,
        titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        // toolbarTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      textTheme: base.textTheme.apply(
        decorationColor: DarkenColour,
        displayColor: DarkenColour,
        bodyColor: DarkenColour,
      ),
      scaffoldBackgroundColor: DarkenColour,
      cardColor: Background,
      backgroundColor: DarkenColour,
    );
  }
}
