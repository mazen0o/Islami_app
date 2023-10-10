import 'package:flutter/material.dart';
import 'package:islami_app/tabs/hadeth/hadeth.dart';
import 'package:islami_app/tabs/hadeth/hadeth_details_screen.dart';

class HadethItem extends StatelessWidget {
  String name;
  List<String> ayat = [];

  HadethItem(this.name, this.ayat);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            HadethDetailsSCreen.routeName,
            arguments: HadethDataModel(name, ayat),
          );
        },
        child: Text(
          textAlign: TextAlign.center,
          "${name}",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
