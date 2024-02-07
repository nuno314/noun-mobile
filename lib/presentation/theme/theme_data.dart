import 'package:emotee/presentation/theme/theme_color.dart';
import 'package:flutter/material.dart';

import 'app_text_theme.dart';

enum SupportedTheme { light, dark }

class AppTheme {
  final String name;
  final ThemeData data;

  const AppTheme(this.name, this.data);
}

InputDecorationTheme buildInputDecorationTheme(ThemeColor themeColor) {
  final border = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
  );
  final focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: themeColor.primaryColor, width: 1),
    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
  );
  return InputDecorationTheme(
    border: border,
    enabledBorder: border,
    focusedBorder: focusedBorder,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 6,
    ),
  );
}

AppTheme buildLightTheme() {
  final textTheme = AppTextTheme().custom(themeColor);

  final theme = ThemeData(
    fontFamily: 'BeVietnamPro',
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: themeColor.scaffoldBackgroundColor,
      titleTextStyle: textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: themeColor.primaryText,
      ),
      elevation: 0,
    ),
    primaryColorLight: themeColor.primaryColorLight,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: themeColor.scaffoldBackgroundColor,
    cardColor: const Color(0xFF3e3c43),
    textTheme: textTheme,
    unselectedWidgetColor: Colors.grey,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: themeColor.primaryColor,
      selectionColor: themeColor.primaryColor,
      selectionHandleColor: themeColor.primaryColor,
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.normal,
      ),
      unselectedLabelColor: themeColor.subText,
      labelColor: themeColor.primaryColor,
    ),
    indicatorColor: themeColor.primaryColor,
    inputDecorationTheme: buildInputDecorationTheme(themeColor),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: themeColor.primaryColor,
      secondary: themeColor.primaryColorLight,
      background: Colors.white,
    ),
    platform: TargetPlatform.iOS,
  );
  return AppTheme(
    SupportedTheme.light.name,
    theme,
  );
}

AppTheme buildDarkTheme() {
  final textTheme = AppTextTheme().custom(themeColor);

  final theme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      color: themeColor.scaffoldBackgroundColor,
      titleTextStyle: textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: themeColor.primaryText,
      ),
      elevation: 0,
    ),
    fontFamily: 'BeVietnamPro',
    primaryColorLight: themeColor.primaryColorLight,
    primaryColor: themeColor.primaryColor,
    scaffoldBackgroundColor: themeColor.scaffoldBackgroundColor,
    cardColor: const Color(0xFF3e3c43),
    textTheme: textTheme,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: themeColor.primaryText,
      secondary: themeColor.subText,
      brightness: Brightness.dark,
    ),
    unselectedWidgetColor: Colors.grey,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: themeColor.primaryText,
      selectionColor: themeColor.primaryColor,
      selectionHandleColor: themeColor.primaryText,
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.normal,
      ),
      unselectedLabelColor: themeColor.subText,
      labelColor: themeColor.primaryColor,
    ),
    indicatorColor: themeColor.primaryColor,
    inputDecorationTheme: buildInputDecorationTheme(themeColor),
    platform: TargetPlatform.iOS,
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: textTheme.bodyMedium,
      backgroundColor: themeColor.cardBackground,
    ),
  );
  return AppTheme(
    SupportedTheme.dark.name,
    theme,
  );
}
