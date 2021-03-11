import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vet_app/domain/providers/global/color_provider.dart';
import 'package:vet_app/domain/providers/home/bottom_nav_provider.dart';
import 'package:vet_app/res/strings.dart';
import 'package:vet_app/util/di/injection.dart';
import 'package:vet_app/util/routing/navigation_service.dart';

class CustomBottomNavBar extends HookWidget {
  final bottomNavigationHeight = 120.0;

  /// Needs to be in a Stack for it to work. Custom shaped bottom navigation bar.
  CustomBottomNavBar();

  @override
  Widget build(BuildContext context) {
    final _colors = useProvider(colorProvider);
    final _bottomNavState = useProvider(bottomNavProvider).state;
    final size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        height: bottomNavigationHeight,
        width: size.width,
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            CustomPaint(
              size: Size(size.width, bottomNavigationHeight),
              painter: BNBPainter(
                  backGroundColor: _colors.appThemeAndroid.bottomAppBarColor,
                  elevation: 10,
                  shadowColor: _colors.appThemeAndroid.buttonColor),
            ),
            Container(
              width: size.width * 0.80,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.today_outlined,
                              color: _bottomNavState == 0
                                  ? _colors.appThemeAndroid.iconTheme.color
                                  : Colors.black,
                            ),
                            Text(
                              "Bookings",
                              style: TextStyle(
                                fontSize: 12,
                                color: _bottomNavState == 0
                                    ? _colors.appThemeAndroid.iconTheme.color
                                    : Colors.black,
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          context.read(bottomNavProvider).state = 0;
                        },
                      ),
                      GestureDetector(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.payment,
                              color: _bottomNavState == 1
                                  ? _colors.appThemeAndroid.iconTheme.color
                                  : Colors.black,
                            ),
                            Text(
                              "Payments",
                              style: TextStyle(
                                fontSize: 12,
                                color: _bottomNavState == 1
                                    ? _colors.appThemeAndroid.iconTheme.color
                                    : Colors.black,
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          context.read(bottomNavProvider).state = 1;
                        },
                      ),
                      GestureDetector(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.analytics_outlined,
                              color: _bottomNavState == 2
                                  ? _colors.appThemeAndroid.iconTheme.color
                                  : Colors.black,
                            ),
                            Text(
                              "Reports",
                              style: TextStyle(
                                fontSize: 12,
                                color: _bottomNavState == 2
                                    ? _colors.appThemeAndroid.iconTheme.color
                                    : Colors.black,
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          context.read(bottomNavProvider).state = 2;
                        },
                      ),
                    ]),
              ),
            ),
            Positioned(
              right: size.width * 0.08,
              bottom: 50,
              child: Container(
                child: FloatingActionButton(
                  onPressed: () {
                    getIt<NavigationService>().navigateTo(SETTINGS_PAGE_ROUTE);
                  },
                  child: Icon(Icons.settings),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BNBPainter extends CustomPainter {
  final shadowColor;
  final backGroundColor;
  final double elevation;

  /// Custom bottom navigation bar painter.
  BNBPainter({
    required this.shadowColor,
    required this.backGroundColor,
    required this.elevation,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backGroundColor
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 40);
    path.lineTo(size.width * 0.75, 40);
    path.arcToPoint(Offset(size.width * 0.95, 40),
        radius: Radius.circular(10.0), clockwise: false);
    path.lineTo(size.width, 40);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawShadow(path, shadowColor, elevation, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
