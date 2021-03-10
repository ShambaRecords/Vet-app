import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SuccessPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Center(child: Text("Congratulations! You have successfully made an appointment with Dr. Flutter"),),
    );
  }
}