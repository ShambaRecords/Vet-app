import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color.fromARGB(255, 73, 111, 91);
const Color primaryColorDarkShade = Color.fromARGB(255, 8, 12, 10);
const Color primaryColorAccent = Color.fromARGB(255, 228, 179, 99);
const Color primaryContrastingColor = Color.fromARGB(255, 201, 242, 153);

const Color paletteRed = Color.fromARGB(255, 239, 100, 97);
const Color palettePurple = Color.fromARGB(255, 125, 56, 125);
const Color raisinBlack = Color.fromARGB(255, 36,35,37);

/// ######### Android #############
///
///
///
/// Text colors for light theme
TextTheme lightTextThemeAndroid = GoogleFonts.ibmPlexSansTextTheme(TextTheme(
  bodyText2: TextStyle(color: Colors.black, fontSize: 18),
  bodyText1: TextStyle(color: Colors.black),
  button: TextStyle(color: Colors.black),
  caption: TextStyle(color: Colors.black),
  headline1: TextStyle(color: Colors.black),
  headline2: TextStyle(color: Colors.black),
  headline3: TextStyle(color: Colors.black),
  headline4: TextStyle(color: Colors.black),
  headline5: TextStyle(color: Colors.black),
  headline6: TextStyle(color: Colors.black),
  overline: TextStyle(color: Colors.black),
  subtitle1: TextStyle(color: Colors.black),
  subtitle2: TextStyle(color: Colors.black),
));

/// Colors theme for material defaults of dark theme
dynamic lightAppThemeAndroid = ThemeData(
  primaryColor: primaryColor,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: lightTextThemeAndroid,
);

/// ######### IOS #############
///
///
///
/// Colors theme for material defaults of dark theme
dynamic lightAppThemeIos = CupertinoThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Colors.white,
  primaryContrastingColor: primaryContrastingColor,
  textTheme: lightTextThemeIos,
);

CupertinoTextThemeData lightTextThemeIos = CupertinoTextThemeData();

/// ######### Shared #############
///
///
///
/// Light mode colors
var homeLightColors = GlobalAppColors(
  name: "lightTheme",
  appThemeAndroid: lightAppThemeAndroid,
  textThemeAndroid: lightTextThemeAndroid,
  appThemeIos: lightAppThemeIos,
  textThemeIos: lightTextThemeIos,
);

/// Container for all things color in vet_app
class GlobalAppColors {
  @required
  String? name;
  @required
  TextTheme? textThemeAndroid;
  @required
  CupertinoTextThemeData? textThemeIos;
  @required
  dynamic appThemeAndroid;
  @required
  dynamic appThemeIos;

  GlobalAppColors({
    this.name,
    this.textThemeAndroid,
    this.textThemeIos,
    this.appThemeAndroid,
    this.appThemeIos,
  });
}
