import 'package:emotee/presentation/modules/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

extension DashboardCoordinator on BuildContext {
  Future<T?> goToPost<T>() async {
    return showDialog(
      context: this,
      builder: (context) => Container(),
    );
  }

  Future<T?> goToDashboard<T>() async {
    return Navigator.pushNamedAndRemoveUntil(
      this,
      DashboardScreen.routeName,
      (_) => false,
    );
  }
}
