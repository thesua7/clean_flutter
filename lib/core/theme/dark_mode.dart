import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade800,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade700,
    inversePrimary: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade900, // Darker AppBar
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.shade200,
      foregroundColor: Colors.black87
      // Default button color in dark mode
    ),
  ),
);
