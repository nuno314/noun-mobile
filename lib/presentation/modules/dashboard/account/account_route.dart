import 'package:emotee/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/account_bloc.dart';
import 'views/account_screen.dart';

class AccountRoute {
  Map<String, WidgetBuilder> getAll(RouteSettings settings) => {
        AccountScreen.routeName: (context) {
          return BlocProvider<AccountBloc>(
            create: (context) => injector(),
            child: const AccountScreen(),
          );
        },
      };
}
