import 'package:emotee/common/utils/data_checker.dart';
import 'package:emotee/presentation/modules/auth/login/views/sign_up_screen.dart';
import 'package:flutter/material.dart';

import 'login.dart';

extension LoginCoordinator on BuildContext {
  Future<T?> goToLogin<T>() async {
    return Navigator.pushNamedAndRemoveUntil(
      this,
      LoginScreen.routeName,
      (_) => false,
    ).then(asOrNull);
  }

  Future<T?> goToSignUp<T>() async {
    return Navigator.pushNamed(
      this,
      SignUpScreen.routeName,
    ).then(asOrNull);
  }
}
