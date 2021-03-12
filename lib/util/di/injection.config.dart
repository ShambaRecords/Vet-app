// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter/widgets.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../domain/api/api_provider.dart' as _i3;
import '../../domain/blocs/appointment_bloc.dart' as _i4;
import '../../domain/repository/bookings_repository.dart' as _i5;
import '../../domain/repository/payments_repository.dart' as _i6;
import '../routing/navigation_service.dart' as _i8;
import 'navigation_module.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final navigationModule = _$NavigationModule();
  gh.factory<_i3.ApiBaseProvider>(() => _i3.ApiBaseProvider());
  gh.factory<_i4.AppointmentBloc>(() => _i4.AppointmentBloc());
  gh.factory<_i5.BookingsRepository>(() => _i5.BookingsRepository());
  gh.factory<_i6.PaymentsRepository>(() => _i6.PaymentsRepository());
  gh.singleton<_i7.GlobalKey<_i7.NavigatorState>>(
      navigationModule.navigatorKey);
  gh.singleton<_i8.NavigationService>(navigationModule.getNavigationService());
  return get;
}

class _$NavigationModule extends _i9.NavigationModule {}
