import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle brand = TextStyle(
    fontFamily: 'BebasNeue',
    fontSize: 64,
    height: 1,
    letterSpacing: 0.5,
    color: AppColors.primary,
  );

  static const TextStyle splashSubtitle = TextStyle(
    fontFamily: 'Oswald',
    fontSize: 44,
    fontWeight: FontWeight.w300,
    height: 1,
    color: AppColors.primary,
  );

  static const TextStyle input = TextStyle(
    fontFamily: 'Oswald',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );

  static const TextStyle body = TextStyle(
    fontFamily: 'Oswald',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );

  static const TextStyle button = TextStyle(
    fontFamily: 'BebasNeue',
    fontSize: 26,
    letterSpacing: 0.6,
    color: AppColors.white,
  );

  static const TextStyle footer = TextStyle(
    fontFamily: 'Oswald',
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: AppColors.primary,
  );
}
