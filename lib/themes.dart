import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  activeLightTheme(context) {
    return ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        buttonTheme: ButtonThemeData(buttonColor: darkBluishColor),
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            iconTheme: const IconThemeData(color: Colors.black),
            titleTextStyle:
                Theme.of(context).appBarTheme.toolbarTextStyle));
  }

  activeDarkTheme(context) {
    return ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: darkCreamColor,
        buttonTheme: ButtonThemeData(buttonColor: lightBluishColor),
        appBarTheme: AppBarTheme(
            color: darkCreamColor,
            elevation: 0.0,
            iconTheme: const IconThemeData(color: Colors.white),
            toolbarTextStyle: const TextStyle(),
            titleTextStyle:
                Theme.of(context).appBarTheme.toolbarTextStyle));
  }

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.purple400;
}
