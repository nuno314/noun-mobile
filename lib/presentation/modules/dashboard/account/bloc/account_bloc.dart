import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../base/base.dart';
import '../interactor/account_interactor.dart';

part 'account_event.dart';
part 'account_state.dart';

@Injectable()
class AccountBloc extends AppBlocBase<AccountEvent, AccountState> {
  final AccountInteractor _interactor;

  AccountBloc(this._interactor)
      : super(
          AccountInitial(
            viewModel: _ViewModel(
              user: FirebaseAuth.instance.currentUser,
            ),
          ),
        ) {
    on<UpdateProfileEvent>(_onUpdateProfileEvent);
  }

  FutureOr<void> _onUpdateProfileEvent(
    UpdateProfileEvent event,
    Emitter<AccountState> emit,
  ) async {
    if (state.user == null) return;
  }
}
