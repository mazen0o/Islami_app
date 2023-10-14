import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String langApp = "ar";
  ThemeMode currentTheme = ThemeMode.light;

  void changeLangauge(String langAppCode) {
    langApp = langAppCode;
    notifyListeners();
  }

  void changeTheming(ThemeMode themeMode) {
    currentTheme = themeMode;
    notifyListeners();
  }

  String getBackGround() {
    if (currentTheme == ThemeMode.light) {
      return "assets/images/back_ground.png";
    } else {
      return "assets/images/back_ground_dark.png";
    }
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }
}
