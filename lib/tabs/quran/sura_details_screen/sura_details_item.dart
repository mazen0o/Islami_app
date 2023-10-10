import 'package:flutter/material.dart';

class SuraDetailsItem extends StatelessWidget {
  String name;
  int index;

  SuraDetailsItem(this.name, this.index);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$name  {$index} ",
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
