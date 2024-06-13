import 'package:flutter/material.dart';

class MyAppColor {
  static const Color primaryColor = Color(0xFF4CAF50);
  static const Color accentColor = Color(0xFF8BC34A);
  static const Color lightgrey = Color(0xFF616161);
  static const Color redcolor = Color(0xFFF44336);
  static const Color greyhard = Color(0xFF9E9E9E);
  static const Color bluecolor = Color(0xFF2196F3);
  static const Color orangecolor = Color(0xFFFF9800);
  static const Color blackcolor = Color(0xFF000000);
  static const Color pinkcolorlight = Color(0xFFE91E63);
  static const Color darkyellow = Color(0xFFFFEB3B);
  static const Color lightteal = Color(0xFF87E3DA);
}

LinearGradient splashGradient = const LinearGradient(
  colors: [
    Color(0xFF9E9E9E),
    Color(0xFFF44336),
    Color(0xFF448AFF),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

LinearGradient chatscreencolor = const LinearGradient(
  colors: [
    MyAppColor.primaryColor,
    MyAppColor.blackcolor,
    MyAppColor.accentColor
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

LinearGradient chatvisibility = const LinearGradient(colors: [
  MyAppColor.lightgrey,
  MyAppColor.darkyellow,
]);
