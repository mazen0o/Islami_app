import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String langApp = "ar";
  ThemeMode currentTheme = ThemeMode.light;

  void changeLangauge(String langAppCode) {
    if (langAppCode == langApp) {
      return;
    }
    langApp = langAppCode;
    notifyListeners();
  }

  void changeTheming(ThemeMode themeMode) {
    if (themeMode == currentTheme) {
      return;
    }
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
