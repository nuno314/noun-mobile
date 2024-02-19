import 'package:flutter/material.dart';

import '../../presentation/theme/theme_data.dart';

class AppData {
  final SupportedTheme currentTheme;
  final Locale locale;

  AppData(
    this.currentTheme,
    this.locale,
  );

  AppData copyWith({
    SupportedTheme? currentTheme,
    Locale? locale,
  }) {
    return AppData(
      currentTheme ?? this.currentTheme,
      locale ?? this.locale,
    );
  }

  ThemeData get theme => currentTheme == SupportedTheme.dark
      ? buildDarkTheme().data
      : buildLightTheme().data;
}
