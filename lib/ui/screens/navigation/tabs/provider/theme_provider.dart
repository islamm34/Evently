import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.dark;

  void updateTheme(ThemeMode newMode){
    themeMode = newMode;
    notifyListeners();
  }
}