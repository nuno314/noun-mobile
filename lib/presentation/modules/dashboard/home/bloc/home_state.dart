part of 'home_bloc.dart';

class _ViewModel {
  const _ViewModel();

  _ViewModel copyWith() {
    return const _ViewModel();
  }
}

abstract class HomeState {
  final _ViewModel viewModel;

  HomeState(this.viewModel);

  T copyWith<T extends HomeState>({
    _ViewModel? viewModel,
  }) {
    return _factories[T == HomeState ? runtimeType : T]!(
      viewModel ?? this.viewModel,
    );
  }
}

class HomeInitial extends HomeState {
  HomeInitial({
    _ViewModel viewModel = const _ViewModel(),
  }) : super(viewModel);
}

final _factories = <
    Type,
    Function(
  _ViewModel viewModel,
)>{
  HomeInitial: (viewModel) => HomeInitial(
        viewModel: viewModel,
      ),
};