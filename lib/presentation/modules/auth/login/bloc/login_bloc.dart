import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emotee/common/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../base/base.dart';
import '../interactor/login_interactor.dart';

part 'login_event.dart';
part 'login_state.dart';

@Injectable()
class LoginBloc extends AppBlocBase<LoginEvent, LoginState> {
  final LoginInteractor _interactor;

  LoginBloc(this._interactor)
      : super(LoginInitial(viewModel: const _ViewModel())) {
    on<SubmitSignUpEvent>(_onSubmitSignUpEvent);
    on<SubmitLoginEvent>(_onSubmitLoginEvent);
  }

  FutureOr<void> _onSubmitSignUpEvent(
    SubmitSignUpEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(state.copyWith<SuccessSignUpState>());
    } on FirebaseAuthException catch (e) {
      LogUtils.e(e);
      if (e.code == 'email-already-in-use') {
        emit(state.copyWith<SignUpExistException>());
      }
    }
  }

  FutureOr<void> _onSubmitSignInEvent(
    SubmitSignUpEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(state.copyWith<SuccessSignUpState>());
    } on FirebaseAuthException catch (e) {
      LogUtils.e(e);
      if (e.code == 'email-already-in-use') {
        emit(state.copyWith<SignUpExistException>());
      }
    }
  }

  FutureOr<void> _onSubmitLoginEvent(
    SubmitLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      print(FirebaseAuth.instance.currentUser);
      emit(state.copyWith<SuccessLoginState>());
    } on FirebaseAuthException catch (e) {
      LogUtils.e(e);
      emit(state.copyWith<LoginException>());
    }
  }
}
