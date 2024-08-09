part of 'account_bloc.dart';

abstract class AccountEvent {}

class UpdateProfileEvent extends AccountEvent {
  final String? username;
  final String? bio;

  UpdateProfileEvent({
    this.username,
    this.bio,
  });
}
