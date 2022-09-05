import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorThemeData with ChangeNotifier {
  final _greenTheme = ThemeData(
    primarySwatch: Colors.green,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.green,
    appBarTheme: AppBarTheme(color: Colors.green),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white)),
  );

  final _redTheme = ThemeData(
    primarySwatch: Colors.red,
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.red,
    appBarTheme: AppBarTheme(color: Colors.red),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white)),
  );


  bool _isGreen = true;

  static SharedPreferences? _sharedPref;

  bool get isGreen => _isGreen;

  void changeTheme(bool selected) {
    _isGreen = selected;
    notifyListeners();
    saveThemetoSharedPref(selected);
  }

  ThemeData get selectedTheme => _isGreen?_greenTheme : _redTheme;//  xyz()._selected X

  Future <void> createPrefObject() async{
    _sharedPref = await SharedPreferences.getInstance(); //Loads and parses the SharedPreferences for this app from disk.

  }

  void saveThemetoSharedPref(bool value) {
    _sharedPref!.setBool("themeData", value);
  }

  void loadThemeFromSharedPref() {
    _isGreen = _sharedPref!.getBool("themeData")??true;
  }


}
