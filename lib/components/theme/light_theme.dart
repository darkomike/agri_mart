import 'package:flutter/material.dart';

import 'color_constant.dart';

class LightTheme {
  static TextTheme lightTextTheme = const TextTheme(
    bodyText1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: TextStyle(
      fontSize: 48.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: TextStyle(
      fontSize: 21.0,
      color: Colors.black,
    ),
    headline6: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  // LIGHT THEME
  static ThemeData light() {
    return ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorConstants.someRockGreen,
          selectedIconTheme: const IconThemeData(color: Colors.white, size: 16),
          unselectedIconTheme: const IconThemeData(color: Colors.white, size: 14),
          selectedItemColor: Colors.white,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w300),
          showSelectedLabels: true,showUnselectedLabels: true,
          elevation: 10,

          ),
      backgroundColor: Colors.white,
      inputDecorationTheme:
          InputDecorationTheme(fillColor: ColorConstants.someRockGreen),
      primaryColor: ColorConstants.someRockGreen,
      accentColor: ColorConstants.someRockGreen,
      scaffoldBackgroundColor: ColorConstants.scaffoldBackgroundColorL,
      fontFamily: 'Poppins',
      iconTheme: const IconThemeData(
        size: 20,
      ),
      textTheme: lightTextTheme,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 1),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            side: MaterialStateProperty.all(
              BorderSide(color: Colors.green.shade100),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.green.shade600),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
      ),
    );
  }
}
