import 'package:flutter/material.dart';

class ColorConstants {
  // static Color darkSpringGreen = const Color(0xFF04724D);
  // static Color darkSeaGreen = const Color(0xFF8DB38D);
  // static Color greenPantone = const Color(0xFF4ab35c);
  static Color primaryColor = const Color(0xFF23AA95);

  // LIGHT THEME CONSTANT COLORS
  // scaffold
  // static Color scaffoldBackgroundColorL = Color.fromARGB(255, 234, 245, 234);
  static Color scaffoldBackgroundColorL = Colors.white;
  static List<Color> scaffoldGradientBackgroundColorL = [
    const Color(0xFF02AAB0),
    const Color(0xFF00CDAC)
  ];

  // buttons
  static Color buttonColorL = primaryColor;

  // -----------------------------------------------------------------
  // DARK THEME CONSTANT COLORS
  // scaffold
  static Color scaffoldBackgroundColorD = Colors.blue.shade800;

  // buttons
  static Color buttonColorD = Colors.black;

  // General constant colors
  static Color backgroundColorD = const Color.fromARGB(255, 34, 32, 32);
}
