import 'package:flutter/material.dart';

const GoldenColour = const Color(0x0FFEEBC1D);
const DarkenColour = Colors.black;

const PrimaryColor = const Color(0xFFE0E5EC);
const PrimaryColorLight = const Color(0xFFFFFFFFF);
const PrimaryColorDark = const Color(0xFFA3B1C6);

// const SecondaryColor = const Color(0xFFb2dfdb);
// const SecondaryColorLight = const Color(0xFFe5ffff);
// const SecondaryColorDark = const Color(0xFF82ada9);

const Background = const Color(0xFFE0E5EC);
const TextColor = const Color(0xFFffffff);

class MyTheme {
  static final ThemeData defaultTheme = _buildMyTheme();

  static ThemeData _buildMyTheme() {
    final ThemeData baseLight = ThemeData.light();

    return baseLight.copyWith(
      hoverColor: PrimaryColor,
      splashColor: PrimaryColorLight,
      popupMenuTheme: PopupMenuThemeData(color: PrimaryColorLight),
      primaryColor: PrimaryColor,
      primaryColorDark: PrimaryColorDark,
      primaryColorLight: PrimaryColorLight,
      appBarTheme: const AppBarTheme(
        backgroundColor: PrimaryColorLight,
        foregroundColor: DarkenColour,
        titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        // toolbarTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      // textTheme: baseLight.textTheme.apply(
      //   decorationColor: DarkenColour,
      //   displayColor: DarkenColour,
      //   bodyColor: DarkenColour,
      // ),
      scaffoldBackgroundColor: Background,
      cardColor: Background,
      backgroundColor: Background,
    );
  }
}
