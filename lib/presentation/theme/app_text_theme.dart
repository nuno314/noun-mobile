import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'theme_color.dart';

class AppTextTheme {
  TextTheme custom(ThemeColor themeColor) => TextTheme(
        displaySmall: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: themeColor.primaryText,
        ),
        headlineMedium: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          color: themeColor.primaryText,
        ),
        headlineSmall: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: themeColor.primaryText,
        ),
        titleLarge: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
          color: themeColor.subText,
        ),
        titleMedium: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: themeColor.subText,
        ),
        titleSmall: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: themeColor.subText,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: themeColor.primaryText,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: themeColor.primaryText,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: themeColor.subText,
        ),
        labelLarge: TextStyle(
          color: themeColor.primaryText,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      );
}

extension TextThemExt on TextTheme {
  TextStyle? get textInput => bodyLarge?.copyWith(
        fontWeight: FontWeight.w400,
      );
  TextStyle? get inputTitle => titleMedium?.copyWith(
        color: const Color(0xFF8D8D94),
        fontWeight: FontWeight.w600,
      );
  TextStyle? get inputRequired => titleLarge!.copyWith(
        color: Colors.red,
      );
  TextStyle? get inputHint => titleSmall;

  TextStyle? get inputError => titleMedium?.copyWith(
        color: Colors.red,
      );
}
