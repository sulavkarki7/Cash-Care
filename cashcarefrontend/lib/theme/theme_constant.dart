import 'package:flutter/material.dart';

//defining the color
//for the main background
//main color
const Color ccBlack = Color(0xff111111);
const Color ccPurple = Color(0xff1D1927);
const Color ccWhite = Color(0xffF7F7F7);
const Color ccGrey = Color(0x5cF7F7F7);

const darkGreen = Color(0xff244c14);
const blueColor = Color(0xff004D40);
//for the buttom navigationbar
const glassWhite = Color(0x99FFFFFF);
const darkReed = Color(0xff712b1f);
//light green(used in hero card)
const lightgreen = Color(0xff8BC34A);

const dark = Color(0xff040404);
const grey = Color(0x5c5b4a);

//green shade for appBar
//#800020?
//800020
//#8B6B61
//#3E2723.
const greenShade = Color(0xff3E2723);

final ThemeData myTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: ccBlack,
  ),
  colorScheme: ColorScheme(
      background: Colors.red,
      onBackground: Colors.white,
      brightness: Brightness.dark,
      primary: ccBlack,
      onPrimary: Colors.white,
      secondary: glassWhite,
      onSecondary: Colors.white,
      error: Colors.white,
      onError: Colors.white,
      surface: darkReed,
      onSurface: Colors.white),
  primarySwatch: Colors.blue,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ccPurple,
      selectedItemColor: ccWhite,
      unselectedItemColor: ccGrey),
  scaffoldBackgroundColor: ccBlack,
);
final ThemeData ccTheme = ThemeData(
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: ccBlack,
      onPrimary: Colors.white,
      secondary: glassWhite,
      onSecondary: Colors.white,
      error: Colors.white,
      onError: Colors.white,
      surface: darkReed,
      onSurface: Colors.white),
  dialogBackgroundColor: Colors.white,
  dialogTheme: DialogTheme(contentTextStyle: TextStyle(color: Colors.black)),
  primarySwatch: Colors.blue,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: glassWhite,
      selectedItemColor: blueColor,
      unselectedItemColor: Color(0xff000000)),
  scaffoldBackgroundColor: blueColor,
);

final ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: ccWhite, // Light background
      onPrimary: Colors.black, // Text in dark color
      secondary: glassWhite,
      onSecondary: Colors.black,
      error: Colors.black,
      onError: Colors.black,
      surface: ccWhite,
      onSurface: Colors.black),
  dialogBackgroundColor: ccWhite,
  dialogTheme: DialogTheme(contentTextStyle: TextStyle(color: Colors.black)),
  primarySwatch: Colors.blue,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ccWhite,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black54),
  scaffoldBackgroundColor: ccWhite, // Light mode background color
);
