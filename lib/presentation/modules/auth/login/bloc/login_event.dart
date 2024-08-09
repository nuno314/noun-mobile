part of 'login_bloc.dart';

abstract class LoginEvent {}

class SubmitLoginEvent extends LoginEvent {
  final String email;
  final String password;

  SubmitLoginEvent({
    required this.email,
    required this.password,
  });
}

class SubmitSignUpEvent extends LoginEvent {
  final String email;
  final String password;

  SubmitSignUpEvent({
    required this.email,
    required this.password,
  });
}
