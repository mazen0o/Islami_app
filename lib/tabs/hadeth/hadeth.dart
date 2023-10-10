import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/tabs/hadeth/hadeth_item.dart';

class HadethScreen extends StatefulWidget {
  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<HadethDataModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      readFileAhadeth();
    }
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset(
            "assets/images/hadeth_image.png",
          ),
          Divider(
            height: 2,
            thickness: 3,
            color: MyThemeData.primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "الاحاديث",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 25,
                  ),
            ),
          ),
          Divider(
            height: 2,
            thickness: 3,
            color: MyThemeData.primaryColor,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (_, index) {
                  return HadethItem(
                      allAhadeth[index].name, allAhadeth[index].ayat);
                },
                separatorBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      height: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  );
                },
                itemCount: allAhadeth.length),
          ),
        ],
      ),
    );
  }

  readFileAhadeth() async {
    String content = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadeth = content.split("#\r\n");
    for (int i = 0; i < hadeth.length; i++) {
      String allHadeth = hadeth[i];
      List<String> lines = allHadeth.split("\n");
      String title = lines[0];
      lines.removeAt(0);
      HadethDataModel hadethModel = HadethDataModel(title, lines);
      allAhadeth.add(hadethModel);
    }
    setState(() {});
  }
}

class HadethDataModel {
  String name;
  List<String> ayat;

  HadethDataModel(this.name, this.ayat);
}
