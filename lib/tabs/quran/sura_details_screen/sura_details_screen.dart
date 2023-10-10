import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/tabs/quran/sura_details_screen/sura_details_item.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "sura_Details_screen";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SuraDetailsModel;
    if (verses.isEmpty) {
      readFile(args.index);
    }
    return Stack(
      children: [
        Image.asset(
          "assets/images/back_ground.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "${args.name}",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            decoration: BoxDecoration(color: Colors.white),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return SuraDetailsItem(verses[index], index + 1);
              },
              itemCount: verses.length,
              separatorBuilder: (context, index) {
                return Container(
                  color: MyThemeData.primaryColor,
                  height: 2,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  readFile(int index) async {
    String ayat = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = ayat.split("\r\n");
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsModel {
  String name;
  int index;

  SuraDetailsModel(this.index, this.name);
}
