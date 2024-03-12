import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

ThemeColor get themeColor => ThemeColor();

class ThemeColor {
  final Color white = Colors.white;
  final Color primaryColor = const Color(0xFF03a1e4);
  final Color primaryColorLight = const Color(0xFF43c8f5);
  final Color cardBackground = const Color(0xFFf7f8f8);
  final Color iconUnselected = Colors.grey;
  final Color lightGrey = const Color(0xFFbebebe);
  final Color greyDC = const Color(0xFFdcdcdc);
  final Color scaffoldBackgroundColor = const Color(0xFFF1F3F7);

  final Color transparent = Colors.transparent;

  final Color inactiveColor = const Color(0xFF111111);

  final Color colorB6BEC9 = const Color(0xFFB6BEC9);
  Color get activeColor => primaryColor;

  final Color titleMenu = Colors.grey;
  final Color primaryIcon = Colors.grey;
  final Color green = const Color(0xFF4d9e53);
  final Color red = const Color(0xFFfb4b53);
  final Color orange = const Color(0xFFff9b1a);
  final Color darkBlue = const Color(0xFF002d41);
  final Color color1B1C26 = const Color(0xFF1B1C26);
  final Color colorF2F2F6 = const Color(0xFFF2F2F6);

  //light
  final Color primaryText = Colors.black;
  final Color subText = const Color(0xFF767676);

  //dart
  final Color primaryDarkText = Colors.black;
  final Color subDarkText = Colors.grey;

  void setLightStatusBar() {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
  }

  void setDarkStatusBar() {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
  }
}
