import 'package:flutter/material.dart';

extension DashboardCoordinator on BuildContext {
  Future<T?> goToPost<T>() async {
    return showDialog(
      context: this,
      builder: (context) => Container(),
    );
  }
}
