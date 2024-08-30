import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: const Color(0xFF03045E),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF03045E),
        background: const Color(0xFFDDDDD1),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF03045E),
          shadowColor: Colors.black,
          foregroundColor: Colors.white,
          fixedSize: Size(
            MediaQuery.of(context).size.width,
            60,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      fontFamily: "Play",
      textTheme: TextTheme(
        // Textos comuns do código
        bodySmall: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        bodyMedium: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        //Display textos que precisam de um tom mais forte ou diferente
        displaySmall: TextStyle(
          fontSize: 12,
          color: Colors.grey.withOpacity(0.8),
          fontWeight: FontWeight.w600,
        ),
        displayLarge: const TextStyle(
          color: Colors.black,
          fontSize: 55,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: const TextStyle(
          color: Colors.white,
          fontFamily: "BrunoAce",
          fontSize: 36,
          fontWeight: FontWeight.w600,
        ),
        // Títulos Agenda, Card, Inputs
        titleLarge: const TextStyle(
          color: Colors.white,
          fontFamily: "BrunoAce",
          fontSize: 36,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          overflow: TextOverflow.ellipsis,
          wordSpacing: 0,
          letterSpacing: 0,
        ),
        titleSmall: const TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        labelLarge: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w500,
          letterSpacing: 5,
          height: 0,
        ),
        labelMedium: const TextStyle(
          color: Colors.greenAccent,
          fontWeight: FontWeight.w800,
          fontSize: 14,
        ),
        labelSmall:  TextStyle(
          fontSize: 16,
          color: Colors.grey.shade800,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static ThemeData darkThemeData() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF03045E),
        background: const Color(0xFFDDDDD1),
      ),
    );
  }
}
