// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/data_source/local/preferences_helper/preferences_helper.dart'
    as _i212;
import '../data/data_source/remote/app_api_service.dart' as _i891;
import '../presentation/common_bloc/app_data_bloc.dart' as _i656;
import '../presentation/modules/auth/login/bloc/login_bloc.dart' as _i261;
import '../presentation/modules/auth/login/interactor/login_interactor.dart'
    as _i81;
import '../presentation/modules/auth/login/repository/login_repository.dart'
    as _i51;
import '../presentation/modules/dashboard/account/bloc/account_bloc.dart'
    as _i1013;
import '../presentation/modules/dashboard/account/interactor/account_interactor.dart'
    as _i132;
import '../presentation/modules/dashboard/account/repository/account_repository.dart'
    as _i666;
import '../presentation/modules/dashboard/cubit/dashboard_cubit.dart' as _i460;
import '../presentation/modules/dashboard/home/bloc/home_bloc.dart' as _i723;
import '../presentation/modules/dashboard/home/interactor/home_interactor.dart'
    as _i276;
import '../presentation/modules/dashboard/home/repository/home_repository.dart'
    as _i506;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i891.AppApiService>(() => _i891.AppApiService());
  gh.factory<_i460.DashboardCubit>(() => _i460.DashboardCubit());
  gh.singletonAsync<_i656.AppDataBloc>(() => _i656.AppDataBloc.create());
  gh.factory<_i212.PreferencesHelper>(() => _i212.PreferencesHelperImpl());
  gh.factory<_i506.HomeRepository>(() => _i506.HomeRepositoryImpl());
  gh.factory<_i666.AccountRepository>(() => _i666.AccountRepositoryImpl());
  gh.factory<_i51.LoginRepository>(() => _i51.LoginRepositoryImpl());
  gh.factory<_i276.HomeInteractor>(
      () => _i276.HomeInteractorImpl(gh<_i506.HomeRepository>()));
  gh.factory<_i81.LoginInteractor>(
      () => _i81.LoginInteractorImpl(gh<_i51.LoginRepository>()));
  gh.factory<_i132.AccountInteractor>(
      () => _i132.AccountInteractorImpl(gh<_i666.AccountRepository>()));
  gh.factory<_i1013.AccountBloc>(
      () => _i1013.AccountBloc(gh<_i132.AccountInteractor>()));
  gh.factory<_i261.LoginBloc>(
      () => _i261.LoginBloc(gh<_i81.LoginInteractor>()));
  gh.factory<_i723.HomeBloc>(() => _i723.HomeBloc(gh<_i276.HomeInteractor>()));
  return getIt;
}
