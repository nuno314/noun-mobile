part of 'login_interactor.dart';

@Injectable(as: LoginInteractor)
class LoginInteractorImpl extends LoginInteractor {
  final LoginRepository _repository;

  LoginInteractorImpl(this._repository);
}