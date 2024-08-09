import 'package:emotee/di/di.dart';
import 'package:emotee/presentation/modules/auth/login/views/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';
import 'views/login_screen.dart';

class LoginRoute {
  static Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        LoginScreen.routeName: (context) {
          return BlocProvider<LoginBloc>(
            create: (context) => injector(),
            child: const LoginScreen(),
          );
        },
        SignUpScreen.routeName: (context) {
          return BlocProvider<LoginBloc>(
            create: (context) => injector(),
            child: const SignUpScreen(),
          );
        },
      };
}
