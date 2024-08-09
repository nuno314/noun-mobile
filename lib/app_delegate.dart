import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emotee/common/constants/app_locale.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart';

import 'common/config.dart';
import 'di/di.dart';
import 'presentation/modules/app.dart';

class AppDelegate {
  static Future<dynamic> run(Map<String, dynamic> env) async {
    WidgetsFlutterBinding.ensureInitialized();

    Config.instance.setup(env);
    await ScreenUtil.ensureScreenSize();

    await Firebase.initializeApp();
    FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: true,
    );
    await configureDependencies();
    setLocaleMessages(AppLocale.vi.languageCode, ViMessages());
    setLocaleMessages(AppLocale.en.languageCode, EnMessages());

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    runApp(const App());
  }
}
