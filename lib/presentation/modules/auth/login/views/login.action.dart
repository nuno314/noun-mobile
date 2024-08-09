part of 'login_screen.dart';

extension LoginAction on _LoginScreenState {
  void _blocListener(BuildContext context, LoginState state) {
    hideLoading();

    if (state is LoginException) {
      showErrorDialog(
        tr.invalidAccount,
      );
    } else if (state is SuccessLoginState) {
      context.goToDashboard();
    }
  }

  _onTapLogin() {
    if (validate() == false) {
      return;
    }

    showLoading();
    bloc.add(
      SubmitLoginEvent(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  _onTapSignUp() {
    context.goToSignUp();
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
    return true;
  }
}
