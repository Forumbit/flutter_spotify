import 'package:flutter/material.dart';

abstract class AppColors {
  // colors
  static const mainColor = Color(0xFF1ED760);
  static const secondaryColor = Color(0xFFD7BD1E);
  static const neutralWhite = Color(0xFFF0F0F0);
  static const neutralBlack = Color(0xFF0F0E0E);
  static const neutralGrey = Color(0xFF333333);

  // gradient
  static const gradient = LinearGradient(
    colors: [
      Color(0xFF000000),
      Color(0xFF333333),
    ],
  );
}
