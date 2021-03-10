import 'package:flutter/material.dart';
import 'package:vet_app/res/colors/colors.dart';
import 'package:vet_app/views/home.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/" : (context) => Home(),
        "/home" : (context) => Home(),
      },
      theme: ThemeData(
        primaryColor: colorPrimary,
        scaffoldBackgroundColor: colorMutedBg,
        unselectedWidgetColor: colorPrimary,
        accentColor: colorSecondary,
      )
  ));
}