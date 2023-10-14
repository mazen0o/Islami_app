import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/tabs/settings/bottom_sheet_app.dart';
import 'package:provider/provider.dart';

import '../../provider/my_provider.dart';
import 'bottom_sheet_app_dark.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              ShowBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              decoration: BoxDecoration(
                  color: pro.isDark()
                      ? MyThemeData.primaryColorDark
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: MyThemeData.primaryColor,
                    width: 2,
                  )),
              child: Text(
                pro.langApp == "en" ? "English" : "العربية",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.themeing,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              ShowBottomSheetDark();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              decoration: BoxDecoration(
                  color: pro.isDark()
                      ? MyThemeData.primaryColorDark
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: MyThemeData.primaryColor,
                    width: 2,
                  )),
              child: Text(
                pro.currentTheme == ThemeMode.light ? "Light" : "Dark",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void ShowBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheetApp();
        });
  }

  void ShowBottomSheetDark() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheetAppDArk();
        });
  }
}
