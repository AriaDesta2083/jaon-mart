import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//! SET COLOR

const makeColor = Color(0xFFFF4C29);
const makeLightColor = Color(0xFFFFECDF);
const makeGradientColor = SweepGradient(
  startAngle: -1,
  endAngle: 2 + 0.3,
  center: Alignment.bottomLeft,
  tileMode: TileMode.repeated,
  colors: [
    Color(0xFFFF4C29),
    Colors.white,
  ],
);
const makeTextColor = Color(0xFF757575);

const makeDuration = Duration(milliseconds: 200);

//! SET TEXTSTYLE

final myBoldStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w800,
  color: Colors.black,
  height: 1.5,
);

final myStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const myDuration = Duration(seconds: 2);

///! SET TEMA

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Poppins",
    appBarTheme: appBarTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: makeTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    focusColor: makeColor,
    suffixStyle: TextStyle(color: makeColor),
    hoverColor: makeColor,
    fillColor: makeColor,
    border: outlineInputBorder,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    toolbarTextStyle: TextTheme(
      headline6: TextStyle(color: Colors.black, fontSize: 24),
    ).bodyText2,
    titleTextStyle: TextTheme(
      headline6: TextStyle(color: Colors.black, fontSize: 24),
    ).headline6,
  );
}
