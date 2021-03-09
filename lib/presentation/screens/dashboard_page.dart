import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class DashboardPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text("Dashboard"),
      ),
      body: const Center(
        child: const Text("Welcome to the dashboard"),
      ),
    );
  }
}
