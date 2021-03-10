import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:vet_app/res/strings.dart';
import 'package:vet_app/util/di/injection.dart';
import 'package:vet_app/util/routing/navigation_service.dart';

class UserHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text("Appointments"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("User Home Page"),
            ElevatedButton(
              onPressed: () =>
                  getIt<NavigationService>().navigateTo(APPOINTMENT_PAGE_ROUTE),
              child: Text("Make Appointment"),
            )
          ],
        ),
      ),
    );
  }
}
