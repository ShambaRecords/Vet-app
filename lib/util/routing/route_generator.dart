import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:vet_app/res/strings.dart';
import 'package:vet_app/screens/apppointment_page/appointment_page.dart';
import 'package:vet_app/screens/home_page/home_page.dart';
import 'package:vet_app/screens/make_payment_page/make_payment_page.dart';
import 'package:vet_app/screens/settings_page/settings_page.dart';
import 'package:vet_app/screens/success_page/success_page.dart';
import 'package:vet_app/screens/user_home_page/user_home_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case HOME_ROUTE:
        return _returnPage(HomePage());
      case SETTINGS_PAGE_ROUTE:
        return _returnPage(SettingsPage());
      case USER_HOME_PAGE_ROUTE:
        return _returnPage(UserHomePage());
      case APPOINTMENT_PAGE_ROUTE:
        return _returnPage(AppointmentPage());
      case SUCCESS_PAGE_ROUTE:
        return _returnPage(SuccessPage());
      case MAKE_PAYMENT_PAGE_ROUTE:
        return _returnPage(MakePaymentPage());

      default:
        return _errorRoute(settings.name);
    }
  }

  static _returnPage(page) {
    if (Platform.isIOS) return CupertinoPageRoute(builder: (_) => page);
    return MaterialPageRoute(builder: (_) => page);
  }

  static Route<dynamic> _errorRoute(String? routeName) {
    return MaterialPageRoute(
      builder: (_) {
        return PlatformScaffold(
          material: (context, platform) => MaterialScaffoldData(
            appBar: AppBar(
              title: Text('An error has ocurred'),
            ),
          ),
          body: Center(
            child: Text('AN ERROR OCCURRED. Provided route was $routeName'),
          ),
        );
      },
    );
  }
}
