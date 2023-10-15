import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  String langApp = "en";
  ThemeMode currentTheme = ThemeMode.light;

  void changeLangauge(String langAppCode) async {
    if (langAppCode == langApp) {
      return;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    langApp = langAppCode;
    prefs.setString("lang", langApp);
    notifyListeners();
  }

  void changeTheming(ThemeMode themeMode) async {
    if (themeMode == currentTheme) {
      return;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    currentTheme = themeMode;
    prefs.setString("theme", themeMode == ThemeMode.light ? "light" : "dark");
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
