import 'package:emotee/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../base/base.dart';
import '../bloc/home_bloc.dart';

part 'home.action.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends StateBase<HomeScreen> {
  @override
  HomeBloc get bloc => BlocProvider.of(context);

  late ThemeData _themeData;

  TextTheme get textTheme => _themeData.textTheme;

  @override
  Widget build(BuildContext context) {
    _themeData = context.theme;
    return BlocConsumer<HomeBloc, HomeState>(
      listener: _blocListener,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            16.w,
            MediaQuery.of(context).padding.top + 16.h,
            16.w,
            16.h,
          ),
          child: const Column(
            children: [
              Text(
                'awd',
              ),
            ],
          ),
        );
      },
    );
  }
}
