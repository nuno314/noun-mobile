import 'package:emotee/common/utils/data_checker.dart';
import 'package:flutter/material.dart';

import 'home.dart';

extension HomeCoordinator on BuildContext {
  Future<T?> gotoHome<T>() async {
    return Navigator.pushNamed(
      this,
      HomeScreen.routeName,
    ).then(asOrNull);
  }
}
