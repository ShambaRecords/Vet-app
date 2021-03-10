import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vet_app/res/colors/colors.dart';
import 'package:vet_app/views/appointments.dart';
import 'package:vet_app/views/dashboard.dart';
import 'package:vet_app/views/payments.dart';
import 'package:vet_app/views/reports.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  DateTime currentBackPressTime;

  List<String> _pageTitles = <String>["Dashboard", "Schedule", "Payments", "Reports"];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
    });
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();

    if (_selectedIndex != 0){
      setState(() {
        _selectedIndex = 0;
      });
      return Future.value(false);
    } else {
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime) > Duration(seconds: 3)) {
        currentBackPressTime = now;
        print("Press again to leave app");

        // Show toast
        Fluttertoast.showToast(
            msg: "Press back again to exit",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: colorSecondary,
            textColor: Colors.white,
            fontSize: 16.0
        );

        return Future.value(false);
      }
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = [];

    DashBoard _dashBoard = new DashBoard();
    _dashBoard.createState();

    Appointments _appointments = new Appointments();
    _appointments.createState();

    Payments _payments = new Payments();
    _payments.createState();

    Reports _reports = new Reports();
    _reports.createState();

    // Add pages to widgets list
    _widgetOptions.add(_dashBoard);
    _widgetOptions.add(_appointments);
    _widgetOptions.add(_payments);
    _widgetOptions.add(_reports);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
              _pageTitles.elementAt(_selectedIndex),
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      backgroundColor: colorMutedBg,
      body: WillPopScope(
        child: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        onWillPop: onWillPop,
      ),
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: colorSecondary,
        textColor: colorSecondary,
        tabs: [
          TabData(
            iconData: Icons.home,
            title: _pageTitles[_selectedIndex]
          ),
          TabData(
              iconData: Icons.search,
              title: _pageTitles[_selectedIndex]
          ),
          TabData(
              iconData: Icons.payments,
              title: _pageTitles[_selectedIndex]
          ),
          TabData(
              iconData: Icons.shopping_cart,
              title: _pageTitles[_selectedIndex]
          )
        ],
        onTabChangedListener: (position) {
          setState(() {
            _selectedIndex = position;
          });
        },
      )
    );
  }
}
