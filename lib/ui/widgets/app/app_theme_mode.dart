import 'package:flutter/material.dart';

abstract class AppThemeMode {
  static final darkTheme = ThemeData(
    primaryColor: Colors.black,
    hintColor: Colors.white,
    fontFamily: 'Montserrat',
    colorScheme: const ColorScheme.dark(),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
    ),
  );

  static final lightTheme = ThemeData(
    hintColor: Colors.black,
    fontFamily: 'Montserrat',
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
    ),
    appBarTheme: const AppBarTheme(
      shadowColor: Colors.transparent,
      backgroundColor: Color.fromARGB(0, 255, 255, 255),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
    ),
  );
}
