part of 'account_interactor.dart';

@Injectable(as: AccountInteractor)
class AccountInteractorImpl extends AccountInteractor {
  final AccountRepository _repository;

  AccountInteractorImpl(this._repository);
}