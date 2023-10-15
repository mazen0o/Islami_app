import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/home_layout.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:islami_app/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/tabs/quran/sura_details_screen/sura_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return MyProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  late MyProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MyProvider>(context);
    sharedPrefs();

    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale: Locale(provider.langApp),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsSCreen.routeName: (context) => HadethDetailsSCreen(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.currentTheme,
    );
  }

  sharedPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString("lang") ?? "en";
    provider.changeLangauge(lang);
    if (prefs.getString("theme") == "light") {
      provider.changeTheming(ThemeMode.light);
    } else if (prefs.getString("theme") == "dark") {
      provider.changeTheming(ThemeMode.dark);
    }
  }
}
