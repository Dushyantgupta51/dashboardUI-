// ignore_for_file: avoid_print

import 'package:dashboardlive/themes.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  static var isDarkModeOn = false;

  convert(context) {
    if (isDarkModeOn) { 
      isDarkModeOn = false;
      print("hello light mode");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Light Theme Applied Succesfully !")));
      return MyTheme().activeLightTheme(context);
    } else {
      isDarkModeOn = true;
      print("Hii dark mode");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Dark Theme Applied Succesfully !")));
      return MyTheme().activeDarkTheme(context);
    }
  }

  toggle(context) {
    convert(context);
    notifyListeners();
  }
}
