import 'package:emotee/presentation/modules/auth/login/login_route.dart';
import 'package:emotee/presentation/modules/dashboard/home/home.dart';
import 'package:flutter/cupertino.dart';

import '../common_widget/text_scale_fixed.dart';
import '../modules/dashboard/dashboard_route.dart';
import '../modules/log_viewer/log_viewer_route.dart';
import '../modules/welcome/welcome_route.dart';

class RouteGenerator {
  static Map<String, WidgetBuilder> _getAll(RouteSettings settings) => {
        ...WelcomeRoute.getAll(settings),
        ...DashboardRoute.getAll(settings),
        ...LogViewerRoute.getAll(settings),
        ...HomeRoute.getAll(settings),
        ...LoginRoute.getAll(settings),
      };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final builder = _getAll(settings)[settings.name!];

    return buildRoute(
      builder ?? (context) => const SizedBox(),
      settings: settings,
    );
  }
}

Route buildRoute<T>(WidgetBuilder builder, {RouteSettings? settings}) {
  return CupertinoPageRoute<T>(
    builder: (context) => TextScaleFixed(
      child: builder(context),
    ),
    settings: settings,
  );
}
