import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightThemeData(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: const Color(0xFF428851),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF428851),
        surface: const Color(0xFFFFFFFF),
        primary: const Color(0xFF428851),
        error: Colors.black45,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF428851),
          maximumSize: Size(MediaQuery.of(context).size.width, 50),
          fixedSize: Size(MediaQuery.of(context).size.width, 50),
          textStyle: Theme.of(context).textTheme.bodyMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        )
      ),
      fontFamily: "Play",
      textTheme: const TextTheme(
        /*
         * Títulos Fonts que excedem 24 de tamanho
         */
        titleLarge: TextStyle(
          color: Colors.white,
          fontFamily: "BrunoAce",
          fontSize: 36,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black,
          overflow: TextOverflow.ellipsis,
          wordSpacing: 0,
          letterSpacing: 0,
        ),
        titleSmall: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        /**
         * Textos pequenos entre 15 e 20 de tamanho
         */
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        /**
         * Textos que precisam de uam formatação diferente
        */
        displayLarge: TextStyle(
          color: Colors.black,
          fontSize: 55,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          fontSize: 12,
          color: Color(0xFF484646),
          fontWeight: FontWeight.w600,
        ),
        /**
         * Textos de uso em caixas de textos ou interações com usuário
         */
        labelLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          letterSpacing: 3,
          height: 0,
        ),
        labelMedium: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          color: Colors.grey,
          fontWeight: FontWeight.w300,
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
        surface: const Color(0xFFDDDDD1),
      ),
    );
  }
}
