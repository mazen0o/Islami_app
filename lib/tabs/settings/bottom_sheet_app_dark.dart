import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/provider/my_provider.dart';
import 'package:provider/provider.dart';

class BottomSheetAppDArk extends StatefulWidget {
  const BottomSheetAppDArk({Key? key}) : super(key: key);

  @override
  State<BottomSheetAppDArk> createState() => _BottomSheetAppDArkState();
}

class _BottomSheetAppDArkState extends State<BottomSheetAppDArk> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                pro.changeTheming(ThemeMode.light);
                Navigator.pop(context);
              },
              child: checkSelected(AppLocalizations.of(context)!.themeLight,
                  pro.currentTheme == ThemeMode.light ? true : false)),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                pro.changeTheming(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: checkSelected(AppLocalizations.of(context)!.themeDark,
                  pro.currentTheme == ThemeMode.dark ? true : false)),
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
