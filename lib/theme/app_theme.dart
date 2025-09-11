import 'package:flutter/material.dart';

class AppTheme {
  // Color scheme based on the original CSS design system
  static const Color primaryTeal = Color(0xFF218D8D);
  static const Color primaryTealHover = Color(0xFF1D7480);
  static const Color primaryTealActive = Color(0xFF1A6873);
  
  static const Color backgroundLight = Color(0xFFFCFCF9);
  static const Color surfaceLight = Color(0xFFFFFFFD);
  static const Color textLight = Color(0xFF13343B);
  static const Color textSecondaryLight = Color(0xFF626C71);
  
  static const Color backgroundDark = Color(0xFF1F2121);
  static const Color surfaceDark = Color(0xFF262828);
  static const Color textDark = Color(0xFFF5F5F5);
  static const Color textSecondaryDark = Color(0xFFA7A9A9);
  
  static const Color errorColor = Color(0xFFC0152F);
  static const Color warningColor = Color(0xFFA84B2F);
  static const Color successColor = Color(0xFF218D8D);
  
  static const Color cardBorderLight = Color(0x1F5E5240);
  static const Color cardBorderDark = Color(0x33777C7C);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryTeal,
      brightness: Brightness.light,
      primary: primaryTeal,
      surface: surfaceLight,
      background: backgroundLight,
      onPrimary: Colors.white,
      onSurface: textLight,
      onBackground: textLight,
      secondary: const Color(0x1F5E5240),
      onSecondary: textLight,
      error: errorColor,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: backgroundLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryTeal,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    cardTheme: CardTheme(
      color: surfaceLight,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: cardBorderLight, width: 1),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryTeal,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: textLight,
        side: BorderSide(color: cardBorderLight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryTeal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceLight,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: cardBorderLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: cardBorderLight),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryTeal, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarTheme(
      backgroundColor: surfaceLight,
      selectedItemColor: primaryTeal,
      unselectedItemColor: textSecondaryLight,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: textLight),
      displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: textLight),
      displaySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: textLight),
      headlineLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: textLight),
      headlineMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: textLight),
      bodyLarge: TextStyle(fontSize: 16, color: textLight),
      bodyMedium: TextStyle(fontSize: 14, color: textLight),
      bodySmall: TextStyle(fontSize: 12, color: textSecondaryLight),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textLight),
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textLight),
      labelSmall: TextStyle(fontSize: 11, color: textSecondaryLight),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF32B8C6), // Teal 300 for dark mode
      brightness: Brightness.dark,
      primary: const Color(0xFF32B8C6),
      surface: surfaceDark,
      background: backgroundDark,
      onPrimary: backgroundDark,
      onSurface: textDark,
      onBackground: textDark,
      secondary: const Color(0x26777C7C),
      onSecondary: textDark,
      error: const Color(0xFFFF5459),
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: backgroundDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF32B8C6),
      foregroundColor: backgroundDark,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: backgroundDark,
      ),
    ),
    cardTheme: CardTheme(
      color: surfaceDark,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: cardBorderDark, width: 1),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF32B8C6),
        foregroundColor: backgroundDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: textDark,
        side: BorderSide(color: cardBorderDark),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF32B8C6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: cardBorderDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: cardBorderDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF32B8C6), width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarTheme(
      backgroundColor: surfaceDark,
      selectedItemColor: Color(0xFF32B8C6),
      unselectedItemColor: textSecondaryDark,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: textDark),
      displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: textDark),
      displaySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: textDark),
      headlineLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: textDark),
      headlineMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: textDark),
      bodyLarge: TextStyle(fontSize: 16, color: textDark),
      bodyMedium: TextStyle(fontSize: 14, color: textDark),
      bodySmall: TextStyle(fontSize: 12, color: textSecondaryDark),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: textDark),
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: textDark),
      labelSmall: TextStyle(fontSize: 11, color: textSecondaryDark),
    ),
  );
}
