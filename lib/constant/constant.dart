import 'package:flutter/material.dart';

class ConstColor {
  static Color whiteColor = Colors.white;
  static Color greyColor = Colors.grey;
  static Color blackColor = Colors.black;
  static Color? scafoldBackColor = Colors.grey[100];
}

class ConstStyle {
  static const TextStyle normalStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static TextStyle appBarStyle = TextStyle(
      fontSize: 22, color: ConstColor.whiteColor, fontWeight: FontWeight.w700);
}
