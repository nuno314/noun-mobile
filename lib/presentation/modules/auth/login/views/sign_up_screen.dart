import 'package:emotee/common/utils.dart';
import 'package:emotee/presentation/common_widget/input_container/input_container.dart';
import 'package:emotee/presentation/extentions/extention.dart';
import 'package:emotee/presentation/modules/auth/login/login_coordinator.dart';
import 'package:emotee/presentation/theme/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../base/base.dart';
import '../bloc/login_bloc.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = '/sign_up';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends StateBase<SignUpScreen> {
  @override
  LoginBloc get bloc => BlocProvider.of(context);

  final _emailController = InputContainerController();
  final _passwordController = InputContainerController();
  final _rePasswordController = InputContainerController();

  late ThemeData _themeData;

  TextTheme get textTheme => _themeData.textTheme;

  @override
  Widget build(BuildContext context) {
    _themeData = context.theme;
    return BlocConsumer<LoginBloc, LoginState>(
      listener: _blocListener,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.fromLTRB(
              16.w,
              MediaQuery.of(context).padding.top,
              16.w,
              0,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
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
                      ),
                      SizedBox(height: 20.h),
                      InputContainer(
                        controller: _rePasswordController,
                        title: tr.reEnterPassword,
                        isPassword: true,
                      ),
                      SizedBox(height: 80.h),
                      ThemeButton.primary(
                        context: context,
                        title: tr.signUp,
                        onPressed: _onTapSignUp,
                      ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _blocListener(BuildContext context, LoginState state) {
    hideLoading();
    if (state is SignUpExistException) {
      showErrorDialog(tr.emailAlreadyExists);
    } else if (state is SuccessSignUpState) {
      showNoticeDialog(
        context: context,
        message: tr.successSignUp,
      ).then((_) {
        context.goToLogin();
      });
    }
  }

  _onTapSignUp() {
    if (validate() == false) {
      return;
    }

    bloc.add(SubmitSignUpEvent(
      email: _emailController.text,
      password: _passwordController.text,
    ));
  }

  bool validate() {
    if (_emailController.text.isEmpty) {
      _emailController.setError(tr.pleaseEnterEmail);
      return false;
    }

    if (_passwordController.text.isEmpty) {
      _passwordController.setError(tr.pleaseEnterPassword);
      return false;
    }

    if (!_passwordController.text.isValidPassword) {
      _passwordController.setError(tr.invalidPassword);
      return false;
    }

    if (_rePasswordController.text.isEmpty) {
      _rePasswordController.setError(tr.pleaseEnterPassword);
      return false;
    }

    if (_rePasswordController.text != _passwordController.text) {
      _rePasswordController.setError(tr.passwordNotMatch);
      return false;
    }

    return true;
  }
}
