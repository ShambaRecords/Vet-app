import 'package:flutter/widgets.dart';

class NavigationService {
  final GlobalKey<NavigatorState>? navigatorKey;

  NavigationService(this.navigatorKey);

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey!.currentState!.pushNamed(routeName);
  }

  Future<dynamic> navigateToAndPopBackStack(String routeName) {
    return navigatorKey!.currentState!.pushNamedAndRemoveUntil(routeName, (route) => route.isFirst);
  }

  void popPage() {
    navigatorKey!.currentState!.pop();
  }
}
