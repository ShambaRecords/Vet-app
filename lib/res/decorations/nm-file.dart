import 'package:flutter/material.dart';
import 'package:vet_app/res/colors/colors.dart';

BoxDecoration nMbox = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: colorGrayLight,
    boxShadow: [
      BoxShadow(
        color: colorBlackOpacity,
        offset: Offset(10, 10),
        blurRadius: 10,
      ),
      BoxShadow(
        color: colorWhite,
        offset: Offset(-10, -10),
        blurRadius: 10,
      ),
    ]
);

BoxDecoration nMboxInvert = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: colorBlackOpacity,
    boxShadow: [
      BoxShadow(
          color: colorWhite,
          offset: Offset(3, 3),
          blurRadius: 3,
          spreadRadius: -3
      ),
    ]
);

BoxDecoration nMboxInvertActive = nMboxInvert.copyWith(color: colorGreenOpacity);

BoxDecoration nMbtn = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: colorGrayLight,
    boxShadow: [
      BoxShadow(
        color: colorBlackOpacity,
        offset: Offset(2, 2),
        blurRadius: 2,
      )
    ]
);