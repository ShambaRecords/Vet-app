import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vet_app/domain/providers/home/bottom_nav_provider.dart';
import 'package:vet_app/screens/bookings_page/bookings_page.dart';
import 'package:vet_app/screens/home_page/widgets.dart';
import 'package:vet_app/screens/payments_page/payments_page.dart';
import 'package:vet_app/screens/reports_page/reports_page.dart';


class HomePage extends HookWidget {
  final _pageOptions = [
    BookingsPage(),
    PaymentsPage(),
    ReportsPage()
  ];
  @override
  Widget build(BuildContext context) {
    final _bottomNavState = useProvider(bottomNavProvider).state;
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text("Home"),
      ),
      body: Stack(
        children: [
          _pageOptions[_bottomNavState],
          CustomBottomNavBar()
        ],
      ),
    );
  }
}
