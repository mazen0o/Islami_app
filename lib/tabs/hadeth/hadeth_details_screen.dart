import 'package:flutter/material.dart';
import 'package:islami_app/tabs/hadeth/hadeth.dart';

class HadethDetailsSCreen extends StatelessWidget {
  static const String routeName = "hadeth-details";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as HadethDataModel;
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
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: SingleChildScrollView(
              child: Text(
                "${args.ayat}",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
