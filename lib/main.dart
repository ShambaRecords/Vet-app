import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vet_app/domain/providers/global/color_provider.dart';
import 'package:vet_app/res/strings.dart';
import 'package:vet_app/util/di/injection.dart';
import 'package:vet_app/util/routing/navigation_service.dart';
import 'package:vet_app/util/routing/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Env.dev);
  runApp(ProviderScope(
    child: Root(),
  ));
}

class Root extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _colors = useProvider(colorProvider);
    return PlatformProvider(
      builder: (context) => PlatformApp(
        localizationsDelegates: <LocalizationsDelegate<dynamic>>[
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        material: (_, __) => MaterialAppData(
          theme: _colors.appThemeAndroid,
        ),
        cupertino: (_, __) => CupertinoAppData(
          theme: _colors.appThemeIos,
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: DASHBOARD_ROUTE,
        navigatorKey: getIt<NavigationService>().navigatorKey,
      ),
    );
  }
}
