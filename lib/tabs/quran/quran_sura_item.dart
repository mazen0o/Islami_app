import 'package:flutter/material.dart';
import 'package:islami_app/tabs/quran/sura_details_screen/sura_details_screen.dart';

class QuranSuraItem extends StatelessWidget {
  String name;
  int index;

  QuranSuraItem(this.index, this.name);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            SuraDetailsScreen.routeName,
            arguments: SuraDetailsModel(index, name),
          );
        },
        child: Text(
          "${name}",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
