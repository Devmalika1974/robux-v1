import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: const Color(0xFF00A86B), // Robux green
        secondary: const Color(0xFF333333), // Dark gray
        tertiary: const Color(0xFF808080), // Medium gray
        surface: const Color(0xFFF8F8F8), // Light background
        error: const Color(0xFFFF5963),
        onPrimary: const Color(0xFFFFFFFF), // White text on primary
        onSecondary: const Color(0xFFFFFFFF), // White text on secondary
        onTertiary: const Color(0xFFFFFFFF), // White text on tertiary
        onSurface: const Color(0xFF1F1F1F), // Nearly black text on surface
        onError: const Color(0xFFFFFFFF),
        outline: const Color(0xFFB0BEC5),
      ),
      brightness: Brightness.light,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.montserrat(
          fontSize: 57.0,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF1F1F1F),
        ),
        displayMedium: GoogleFonts.montserrat(
          fontSize: 45.0,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF1F1F1F),
        ),
        displaySmall: GoogleFonts.montserrat(
          fontSize: 36.0,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1F1F1F),
        ),
        headlineLarge: GoogleFonts.montserrat(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF1F1F1F),
        ),
        headlineMedium: GoogleFonts.montserrat(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1F1F1F),
        ),
        headlineSmall: GoogleFonts.montserrat(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF1F1F1F),
        ),
        titleLarge: GoogleFonts.montserrat(
          fontSize: 22.0,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1F1F1F),
        ),
        titleMedium: GoogleFonts.montserrat(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1F1F1F),
        ),
        titleSmall: GoogleFonts.montserrat(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1F1F1F),
        ),
        labelLarge: GoogleFonts.montserrat(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF00A86B),
        ),
        labelMedium: GoogleFonts.montserrat(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF00A86B),
        ),
        labelSmall: GoogleFonts.montserrat(
          fontSize: 12.0,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF00A86B),
        ),
        bodyLarge: GoogleFonts.montserrat(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          color: const Color(0xFF1F1F1F),
        ),
        bodyMedium: GoogleFonts.montserrat(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
          color: const Color(0xFF1F1F1F),
        ),
        bodySmall: GoogleFonts.montserrat(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: const Color(0xFF1F1F1F),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00A86B), // Robux green
          foregroundColor: Colors.white,
          elevation: 4,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF808080)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF00A86B), width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        primary: const Color(0xFF00A86B), // Robux green
        secondary: const Color(0xFF333333), // Dark gray
        tertiary: const Color(0xFF808080), // Medium gray
        surface: const Color(0xFF1A1A1A), // Dark background
        error: const Color(0xFFFF5963),
        onPrimary: const Color(0xFFFFFFFF), // White text on primary
        onSecondary: const Color(0xFFFFFFFF), // White text on secondary
        onTertiary: const Color(0xFFFFFFFF), // White text on tertiary
        onSurface: const Color(0xFFE5E7EB), // Light gray text on surface
        onError: const Color(0xFFFFFFFF),
        outline: const Color(0xFF37474F),
      ),
      brightness: Brightness.dark,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.montserrat(
          fontSize: 57.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        displayMedium: GoogleFonts.montserrat(
          fontSize: 45.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        displaySmall: GoogleFonts.montserrat(
          fontSize: 36.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        headlineLarge: GoogleFonts.montserrat(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        headlineMedium: GoogleFonts.montserrat(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        headlineSmall: GoogleFonts.montserrat(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleLarge: GoogleFonts.montserrat(
          fontSize: 22.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        titleMedium: GoogleFonts.montserrat(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        titleSmall: GoogleFonts.montserrat(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        labelLarge: GoogleFonts.montserrat(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF00A86B),
        ),
        labelMedium: GoogleFonts.montserrat(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF00A86B),
        ),
        labelSmall: GoogleFonts.montserrat(
          fontSize: 12.0,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF00A86B),
        ),
        bodyLarge: GoogleFonts.montserrat(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        bodyMedium: GoogleFonts.montserrat(
          fontSize: 14.0,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        bodySmall: GoogleFonts.montserrat(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00A86B), // Robux green
          foregroundColor: Colors.white,
          elevation: 4,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF808080)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF00A86B), width: 2),
        ),
        filled: true,
        fillColor: const Color(0xFF333333),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );