part of 'login_bloc.dart';

class _ViewModel {
  const _ViewModel();

  _ViewModel copyWith() {
    return const _ViewModel();
  }
}

abstract class LoginState {
  final _ViewModel viewModel;

  LoginState(this.viewModel);

  T copyWith<T extends LoginState>({
    _ViewModel? viewModel,
  }) {
    return _factories[T == LoginState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
    );
  }
}

class LoginInitial extends LoginState {
  LoginInitial({
    _ViewModel viewModel = const _ViewModel(),
  }) : super(viewModel);
}

class LoginException extends LoginState {
  LoginException({
    _ViewModel viewModel = const _ViewModel(),
  }) : super(viewModel);
}

class SignUpExistException extends LoginState {
  SignUpExistException({
    _ViewModel viewModel = const _ViewModel(),
  }) : super(viewModel);
}

class SuccessSignUpState extends LoginState {
  SuccessSignUpState({
    _ViewModel viewModel = const _ViewModel(),
  }) : super(viewModel);
}

class SuccessLoginState extends LoginState {
  SuccessLoginState({
    _ViewModel viewModel = const _ViewModel(),
  }) : super(viewModel);
}

final _factories = <Type,
    Function(
  _ViewModel viewModel,
)>{
  LoginInitial: (viewModel) => LoginInitial(
        viewModel: viewModel,
      ),
  SignUpExistException: (viewModel) => SignUpExistException(
        viewModel: viewModel,
      ),
  SuccessSignUpState: (viewModel) => SuccessSignUpState(
        viewModel: viewModel,
      ),
  SuccessLoginState: (viewModel) => SuccessLoginState(
        viewModel: viewModel,
      ),
  LoginException: (viewModel) => LoginException(
        viewModel: viewModel,
      ),
};
