import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF673AB7);
  static const Color hintColor = Color(0xFF1976D2);
  static const Color textBackground = Color(0x3E000000);
  static const Color whiteColor = Color(0xFFFFFFFF);

  static TextStyle displayLarge = GoogleFonts.pacifico(
    textStyle: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  static TextStyle bodyLarge = GoogleFonts.roboto(
    textStyle: const TextStyle(
      fontSize: 18,
      color: Colors.white,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    hintColor: hintColor,
    textTheme: TextTheme(
      displayLarge: displayLarge,
      bodyLarge: bodyLarge,
    ),
  );
}
