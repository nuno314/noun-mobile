import 'package:emotee/common/utils.dart';
import 'package:emotee/presentation/common_widget/input_container/input_container.dart';
import 'package:emotee/presentation/extentions/extention.dart';
import 'package:emotee/presentation/modules/auth/login/login_coordinator.dart';
import 'package:emotee/presentation/modules/dashboard/dashboard_coordinator.dart';
import 'package:emotee/presentation/theme/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../base/base.dart';
import '../bloc/login_bloc.dart';

part 'login.action.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends StateBase<LoginScreen> {
  @override
  LoginBloc get bloc => BlocProvider.of(context);

  final _emailController = InputContainerController();
  final _passwordController = InputContainerController();

  late ThemeData _themeData;

  TextTheme get textTheme => _themeData.textTheme;

  @override
  Widget build(BuildContext context) {
    _themeData = context.theme;
    return BlocConsumer<LoginBloc, LoginState>(
      listener: _blocListener,
      builder: (context, state) {
        return Scaffold(
          body: Container(
            padding: EdgeInsets.fromLTRB(
              16.w,
              MediaQuery.of(context).padding.top,
              16.w,
              0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 120.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: tr.appName,
                          style: textTheme.displayLarge!.copyWith(
                            fontSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(height: 50.h),
                  InputContainer(
                    controller: _emailController,
                    title: tr.emailAddress,
                  ),
                  SizedBox(height: 20.h),
                  InputContainer(
                    controller: _passwordController,
                    title: tr.password,
                    isPassword: true,
                    onSubmitted: (p0) => _onTapLogin(),
                  ),
                  SizedBox(height: 80.h),
                  ThemeButton.primary(
                    context: context,
                    title: tr.login,
                    onPressed: _onTapLogin,
                  ),
                  SizedBox(height: 20.h),
                  ThemeButton.primary(
                    context: context,
                    title: tr.signUp,
                    color: Theme.of(context).primaryColor,
                    onPressed: _onTapSignUp,
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
