import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primary = Color(0xFF153757);
  static const background = Color(0xFFF0F1F3);
  static const field = Color(0xFFD8DDE3);
  static const textMuted = Color(0xFF5E7490);
}

class AppTheme {
  static ThemeData get theme {
    final textTheme = GoogleFonts.oswaldTextTheme().apply(
      bodyColor: AppColors.primary,
      displayColor: AppColors.primary,
    );

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        surface: AppColors.background,
      ),
      textTheme: textTheme.copyWith(
        headlineLarge: GoogleFonts.bebasNeue(
          fontSize: 56,
          color: AppColors.primary,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
        ),
        headlineMedium: GoogleFonts.bebasNeue(
          fontSize: 52,
          color: AppColors.primary,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
        ),
        titleLarge: GoogleFonts.oswald(
          fontSize: 20,
          color: AppColors.primary,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: GoogleFonts.oswald(fontSize: 18, color: AppColors.primary),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.field,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.3),
        ),
        hintStyle: GoogleFonts.oswald(
          color: AppColors.primary.withValues(alpha: 0.8),
          fontSize: 18,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        side: const BorderSide(color: AppColors.textMuted, width: 1.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}
