import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:vet_app/res/strings.dart';
import 'package:vet_app/util/di/injection.dart';
import 'package:vet_app/util/routing/navigation_service.dart';

class SettingsPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: false,
            onChanged: (value) {},
            title: Text("Animations"),
          ),
          ListTile(
              title: Text("View user app", style: TextStyle(color: Theme.of(context).accentColor),),
              onTap: () =>
                  getIt<NavigationService>().navigateTo(USER_HOME_PAGE_ROUTE)),
        ],
      ),
    );
  }
}
