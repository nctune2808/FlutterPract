import 'dart:js';

import 'package:flutter/material.dart';

const GoldenColour = const Color(0x0FFEEBC1D);
const BlackenColour = Colors.black;

const PrimaryColor = const Color(0xFFE0E5EC);
const PrimaryColorLight = const Color(0xFFFFFFFFF);
const PrimaryColorDark = const Color(0xFFA3B1C6);
const PrimaryColorDisable = const Color(0x5EA3B1C6);

// const background = Color(0xFFDDE6E8);
// const accent = Color(0xFF2196F3);
// const variant = Color(0xFF00BCD4);
// const disabled = Color(0xFF9E9E9E);

// const darkBackground = Color(0xFF2D2F2F);
// const darkAccent = Color(0xFF4CAF50);
// const darkVariant = Color(0xFF607D8B);
// const darkDisabled = Color(0xB3FFFFFF);
// const darkDefaultTextColor = Color(0xB3FFFFFF);

// const Color defaultBorder = Color(0x33000000);
// const Color darkDefaultBorder = Color(0x33FFFFFF);

class MyTheme {
  static final ThemeData defaultTheme = _buildMyTheme();

  static ThemeData _buildMyTheme() {
    final ThemeData baseLight = ThemeData.light();

    return baseLight.copyWith(
      hoverColor: PrimaryColorDark,
      splashColor: PrimaryColorLight,
      popupMenuTheme: PopupMenuThemeData(color: PrimaryColor),
      primaryColor: PrimaryColor,
      primaryColorDark: PrimaryColorDark,
      primaryColorLight: PrimaryColorLight,
      scaffoldBackgroundColor: PrimaryColor,
      cardColor: PrimaryColor,
      backgroundColor: PrimaryColor,
      appBarTheme: const AppBarTheme(
        elevation: 5,
        backgroundColor: PrimaryColor,
        foregroundColor: BlackenColour,
        // titleTextStyle: TextStyle(
        //     color: BlackenColour, fontSize: 50, fontWeight: FontWeight.bold),
        // toolbarTextStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      ),
      // textTheme: baseLight.textTheme.apply(
      //   decorationColor: BlackenColour,
      //   displayColor: BlackenColour,
      //   bodyColor: BlackenColour,
      // ),
      drawerTheme: baseLight.drawerTheme.copyWith(
        backgroundColor: PrimaryColor,
        scrimColor: Colors.black87,
        elevation: 5,
      ),
      sliderTheme: baseLight.sliderTheme.copyWith(
        trackHeight: 8,
        activeTrackColor: PrimaryColorDark,
        inactiveTrackColor: PrimaryColorDisable,
        overlayColor: PrimaryColorDisable,
        overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
        thumbColor: PrimaryColorDark,
        activeTickMarkColor: PrimaryColorDark,
        inactiveTickMarkColor: PrimaryColorDisable,
        // valueIndicatorShape: PaddleSliderValueIndicatorShape(),
        // valueIndicatorColor: Colors.redAccent,
        // valueIndicatorTextStyle: TextStyle(
        //   color: Colors.white,
        // ),
        // thumbShape: RoundSliderThumbShape(
        //   elevation: -1,
        //   enabledThumbRadius: 20,
        // ),
      ),
    );
  }
}
