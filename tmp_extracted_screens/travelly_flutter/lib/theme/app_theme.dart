import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF153757);
  static const Color background = Color(0xFFF5F5F5);
  static const Color inputFill = Color(0xFFFFFFFF);
  static const Color inputBorder = Color(0xFFD9D9D9);
  static const Color textMuted = Color(0xFF6E6E6E);
  static const Color accent = Color(0xFF39D5E7);
}

class AppTextStyles {
  static const TextStyle logo = TextStyle(
    fontFamily: 'BebasNeue',
    fontSize: 42,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
    letterSpacing: 0.5,
    height: 1,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: 'Oswald',
    fontSize: 22,
    fontWeight: FontWeight.w300,
    color: AppColors.primary,
    height: 1.1,
  );

  static const TextStyle label = TextStyle(
    fontFamily: 'Oswald',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  static const TextStyle body = TextStyle(
    fontFamily: 'Oswald',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );

  static const TextStyle muted = TextStyle(
    fontFamily: 'Oswald',
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.textMuted,
  );

  static const TextStyle button = TextStyle(
    fontFamily: 'Oswald',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const TextStyle secondaryButton = TextStyle(
    fontFamily: 'Oswald',
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );
}

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      useMaterial3: true,
      textTheme: const TextTheme(
        bodyLarge: AppTextStyles.body,
        bodyMedium: AppTextStyles.body,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(Colors.white),
        side: const BorderSide(color: AppColors.primary, width: 1.2),
      ),
    );
  }
}
