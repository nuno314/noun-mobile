import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../base/base.dart';
import '../interactor/home_interactor.dart';
import '../repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

@Injectable()
class HomeBloc extends AppBlocBase<HomeEvent, HomeState> {
  final HomeInteractor _interactor;
  
  HomeBloc(this._interactor) : 
    super(HomeInitial(viewModel: const _ViewModel())) {
    on<HomeEvent>(_onHomeEvent);
  }

  Future<void> _onHomeEvent(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {}
}