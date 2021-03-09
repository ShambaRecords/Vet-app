import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

class NavigationService {
  final GlobalKey<NavigatorState>? navigatorKey;

  NavigationService(this.navigatorKey);

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey!.currentState!.pushNamed(routeName);
  }

  void popPage() {
    navigatorKey!.currentState!.pop();
  }
}