import 'package:block_agri_mart/components/theme/theme.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  static TextTheme darkTextTheme = const TextTheme(
    bodyText1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: TextStyle(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: TextStyle(
      fontSize: 16.0,
      color: Colors.white,
    ),
    headline6: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  // DARK THEME
  static ThemeData dark() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: ColorConstants.backgroundColorD.withOpacity(0.8),
      ),
      backgroundColor: ColorConstants.backgroundColorD.withOpacity(0.8),
      scaffoldBackgroundColor: ColorConstants.backgroundColorD.withOpacity(0.8), 
      fontFamily: 'Poppins',
      primaryColor: ColorConstants.primaryColor,
      textTheme: darkTextTheme,
      iconTheme: const IconThemeData(
        size: 20,
        color: Colors.white
      ),
    );
  }
}
