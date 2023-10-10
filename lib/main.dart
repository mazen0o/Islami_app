import 'package:flutter/material.dart';
import 'package:islami_app/home_layout.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/tabs/quran/sura_details_screen/sura_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
    );
  }
}
