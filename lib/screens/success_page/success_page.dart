import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:vet_app/res/strings.dart';
import 'package:vet_app/util/di/injection.dart';
import 'package:vet_app/util/routing/navigation_service.dart';

class SuccessPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                  "Congratulations! You have successfully made an appointment with Dr. Flutter"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: () {
                getIt<NavigationService>().navigateTo(HOME_ROUTE);
              }, child: Text("Go to Vet Home")),
              TextButton(onPressed: () {
                getIt<NavigationService>().navigateTo(USER_HOME_PAGE_ROUTE);
              }, child: Text("Go to User Home")),
            ],
          )
        ],
      ),
    );
  }
}
