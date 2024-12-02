import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          titleLarge: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
          labelLarge: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      );
}
