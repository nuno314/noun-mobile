import 'package:emotee/di/di.dart';
import 'package:emotee/presentation/modules/dashboard/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_screen.dart';

class DashboardRoute {
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        DashboardScreen.routeName: (context) => BlocProvider<DashboardCubit>(
              create: (context) => injector(),
              child: const DashboardScreen(),
            ),
      };
}
