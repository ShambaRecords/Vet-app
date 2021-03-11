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
      material: (_, __) => MaterialScaffoldData(
          floatingActionButton: FloatingActionButton(
        onPressed: () => getIt<NavigationService>().navigateTo(HOME_ROUTE),
        child: Icon(Icons.home),
      )),
      appBar: PlatformAppBar(
        title: const Text("Appointments"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                ListTile(
                  title: Text(
                    "Make Appointment",
                  ),
                  onTap: () => getIt<NavigationService>()
                      .navigateTo(APPOINTMENT_PAGE_ROUTE),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Icon(Icons.payment),
                      Padding(padding: EdgeInsets.only(left: 15)),
                      Text(
                        "Make Payment",
                      ),
                    ],
                  ),
                  onTap: () =>
                      getIt<NavigationService>().navigateTo(HOME_ROUTE),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
