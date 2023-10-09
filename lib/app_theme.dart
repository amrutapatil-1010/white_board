import 'package:flutter/material.dart';

class AppTheme {
  static const sfProText = "SF_Pro_Text";
  static const _primaryColor = Color.fromARGB(255, 255, 255, 255);
  static const _displaySmallColor = Color.fromRGBO(0, 0, 0, 1);
  static const _titleLargeColor = Color.fromRGBO(0, 0, 0, 0.3);
  static const _headlineSmallColor = Color.fromRGBO(112, 112, 112, 1);
  static const _headlineMediumColor = Color.fromRGBO(0, 37, 99, 1);
  static const _selectedTileColor = Color.fromRGBO(116, 116, 128, 0.08);

  static final lightTheme = ThemeData(
      // Text style for launch screen title
      primaryTextTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: sfProText,
      fontSize: 30,
      color: _primaryColor,
      letterSpacing: 0,
    ),
  ));
}
