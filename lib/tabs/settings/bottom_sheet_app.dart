import 'package:flutter/material.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:provider/provider.dart';

class BottomSheetApp extends StatefulWidget {
  const BottomSheetApp({Key? key}) : super(key: key);

  @override
  State<BottomSheetApp> createState() => _BottomSheetAppState();
}

class _BottomSheetAppState extends State<BottomSheetApp> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                pro.changeLangauge("en");
                Navigator.pop(context);
              },
              child:
                  checkSelected("English", pro.langApp == "en" ? true : false)),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                pro.changeLangauge("ar");
                Navigator.pop(context);
              },
              child:
                  checkSelected("العربية", pro.langApp == "ar" ? true : false)),
        ],
      ),
    );
  }

  Widget checkSelected(String text, bool select) {
    if (select) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$text",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          Icon(
            Icons.check,
            color: MyThemeData.primaryColor,
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$text",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Icon(
            Icons.check,
          ),
        ],
      );
    }
  }
}
