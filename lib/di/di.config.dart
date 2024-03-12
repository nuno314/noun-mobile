// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/data_source/local/preferences_helper/preferences_helper.dart'
    as _i7;
import '../data/data_source/remote/app_api_service.dart' as _i3;
import '../presentation/common_bloc/app_data_bloc.dart' as _i4;
import '../presentation/modules/dashboard/cubit/dashboard_cubit.dart' as _i5;
import '../presentation/modules/dashboard/home/bloc/home_bloc.dart' as _i9;
import '../presentation/modules/dashboard/home/interactor/home_interactor.dart'
    as _i8;
import '../presentation/modules/dashboard/home/repository/home_repository.dart'
    as _i6;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AppApiService>(() => _i3.AppApiService());
  gh.singletonAsync<_i4.AppDataBloc>(() => _i4.AppDataBloc.create());
  gh.lazySingleton<_i5.DashboardCubit>(() => _i5.DashboardCubit());
  gh.factory<_i6.HomeRepository>(() => _i6.HomeRepositoryImpl());
  gh.factory<_i7.PreferencesHelper>(() => _i7.PreferencesHelperImpl());
  gh.factory<_i8.HomeInteractor>(
      () => _i8.HomeInteractorImpl(gh<_i6.HomeRepository>()));
  gh.factory<_i9.HomeBloc>(() => _i9.HomeBloc(gh<_i8.HomeInteractor>()));
  return getIt;
}
