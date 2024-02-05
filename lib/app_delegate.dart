import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common/config.dart';
import 'di/di.dart';
import 'presentation/modules/app.dart';

class AppDelegate {
  static Future<dynamic> run(Map<String, dynamic> env) async {
    WidgetsFlutterBinding.ensureInitialized();

    Config.instance.setup(env);

    await Future.wait([
      configureDependencies(),
    ]);

    runApp(const App());
  }
}
