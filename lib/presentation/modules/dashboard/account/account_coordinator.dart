import 'package:emotee/common/utils/data_checker.dart';
import 'package:flutter/material.dart';

import 'account.dart';

extension AccountCoordinator on BuildContext {
  Future<T?> gotoAccount<T>() async {
    return Navigator.pushNamed(
      this,
      AccountScreen.routeName,
    ).then(asOrNull);
  }
}
