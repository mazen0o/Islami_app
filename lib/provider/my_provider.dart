import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String langApp = "ar";

  void changeLangauge(String langAppCode) {
    langApp = langAppCode;
    notifyListeners();
  }
}
