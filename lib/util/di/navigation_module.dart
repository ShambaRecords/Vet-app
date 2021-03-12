import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:vet_app/util/routing/navigation_service.dart';

@module
abstract class NavigationModule {

  @singleton
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @singleton
  NavigationService getNavigationService() => NavigationService(navigatorKey);
}