import 'package:flutter/material.dart';

class MyThemeData {
  static Color primaryColor = Color(0xFFB7935F);
  static Color blackColor = Color(0xFF242424);
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: blackColor,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: TextTheme(
      displaySmall: TextStyle(
        color: blackColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: blackColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      displayLarge: TextStyle(
        color: blackColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: blackColor, unselectedItemColor: Colors.white),
  );

  static final ThemeData darkTheme = ThemeData();
}
