import 'package:emotee/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';
import 'views/home_screen.dart';

class HomeRoute {
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        HomeScreen.routeName: (context) {
          return BlocProvider<HomeBloc>(
            create: (context) => injector(),
            child: const HomeScreen(),
          );
        },
      };
}
