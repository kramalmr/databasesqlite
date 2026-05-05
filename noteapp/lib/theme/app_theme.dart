import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final TextTheme baseText = GoogleFonts.poppinsTextTheme();

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Colors.blueAccent,
      secondary: Colors.lightBlueAccent,
      surface: Colors.white,
    ),

    scaffoldBackgroundColor: Colors.grey.shade50,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
    ),

    dialogTheme: DialogThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      titleTextStyle: AppTheme.baseText.bodyMedium?.copyWith(
        fontSize: 14,
        color: Colors.black87,
      ),
    ),

    textTheme: baseText.copyWith(
      titleLarge: baseText.titleLarge?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      bodyMedium: baseText.bodyMedium?.copyWith(
        fontSize: 14,
        color: Colors.black87,
      ),
      bodySmall: baseText.bodySmall?.copyWith(fontSize: 12, color: Colors.grey),
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color.fromARGB(255, 13, 71, 161),
      secondary: Color.fromARGB(255, 25, 118, 210),
      surface: Colors.black,
    ),

    scaffoldBackgroundColor: Colors.black,

    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 13, 71, 161),
      foregroundColor: Colors.black,
      elevation: 0,
    ),

    cardTheme: CardThemeData(
      color: Colors.black,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
    ),

    dialogTheme: DialogThemeData(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      titleTextStyle: AppTheme.baseText.bodyMedium?.copyWith(
        fontSize: 14,
        color: Colors.white,
      ),
    ),

    textTheme: baseText.copyWith(
      titleLarge: baseText.titleLarge?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: baseText.bodyMedium?.copyWith(
        fontSize: 14,
        color: Colors.white,
      ),
      bodySmall: baseText.bodySmall?.copyWith(
        fontSize: 12,
        color: Colors.grey[50],
      ),
    ),
  );
}
