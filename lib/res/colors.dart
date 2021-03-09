import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const Color eRevenueRed = Color.fromARGB(255, 233, 1, 1);
const Color eRevenueDarkRed = Color.fromARGB(255, 195, 52, 49);
const Color eRevenueBlue = Color.fromARGB(255, 0, 93, 233);
const Color eRevenueGreen = Color.fromARGB(255, 0, 233, 93);
const Color kenyaGreen = Color.fromARGB(255, 0, 102, 0);
const Color eRevenueWhite = Color.fromARGB(255, 255, 255, 255);

/// Text colors for dark theme
const TextTheme lightTextTheme = TextTheme(
    bodyText2: TextStyle(color: Colors.white),
    bodyText1: TextStyle(color: Colors.white),
    headline6: TextStyle(color: Colors.black));

/// Colors theme for material defaults of dark theme
dynamic lightAppThemeAndroid = ThemeData(
  primarySwatch: Colors.green,
  inputDecorationTheme: InputDecorationTheme(),
  appBarTheme: AppBarTheme(color: eRevenueDarkRed),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

/// Colors theme for material defaults of dark theme
dynamic lightAppThemeIos = CupertinoThemeData(
  primaryColor: eRevenueRed,
  scaffoldBackgroundColor: eRevenueWhite,
  primaryContrastingColor: eRevenueDarkRed,
);

/// Light mode colors
var homeLightColors = GlobalAppColors(
  name: "lightTheme",
  mainBackgroundColor: eRevenueWhite,
  appThemeAndroid: lightAppThemeAndroid,
  appThemeIos: lightAppThemeIos,
  mainButtonsColor: eRevenueRed,
  mainIconsColor: kenyaGreen,
  mainTextColor: Colors.black,
  secondaryTextColor: Colors.white,
  secondaryIconsColor: Colors.black,
  appBarBackgroundColor: eRevenueDarkRed,
  textTheme: lightTextTheme,
);

/// Container for all things color in vet_app
class GlobalAppColors {
  @required String? name;
  @required Color? mainBackgroundColor;
  @required Color? mainButtonsColor;
  @required Color? mainIconsColor;
  @required Color? mainTextColor;
  @required Color? secondaryTextColor;
  @required Color? secondaryIconsColor;
  @required TextTheme? textTheme;
  @required dynamic appThemeAndroid;
  @required dynamic appThemeIos;
  @required Color? appBarBackgroundColor;

  GlobalAppColors({
    this.name,
    this.mainBackgroundColor,
    this.mainButtonsColor,
    this.mainIconsColor,
    this.secondaryIconsColor,
    this.mainTextColor,
    this.secondaryTextColor,
    this.textTheme,
    this.appBarBackgroundColor,
    this.appThemeAndroid,
    this.appThemeIos,
  });
}