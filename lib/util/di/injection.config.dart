// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter/widgets.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../routing/navigation_service.dart' as _i4;
import 'navigation_module.dart' as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final navigationModule = _$NavigationModule();
  gh.singleton<_i3.GlobalKey<_i3.NavigatorState>>(
      navigationModule.navigatorKey);
  gh.singleton<_i4.NavigationService>(navigationModule.getNavigationService());
  return get;
}

class _$NavigationModule extends _i5.NavigationModule {}
