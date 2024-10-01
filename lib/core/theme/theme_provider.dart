
import 'package:flutter/material.dart';

import 'dark_mode.dart';
import 'light_mode.dart';


class ThemeProvider extends ChangeNotifier{

  // default light mode
  ThemeData _themeData = lightMode;

  // get theme data
  ThemeData get themeData => _themeData;

  // is dark mode
  bool get isDarkMode => _themeData == darkMode;

  // set theme

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData == lightMode){
      themeData = darkMode;
    }else{
      themeData = lightMode;
    }

  }




}