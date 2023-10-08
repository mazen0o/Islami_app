import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  List<String> tsbeh = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
  ];
  int index = 0;
  int counter = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.transparent,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            height: size.height * .4,
            child: Stack(
              children: [
                Positioned(
                  left: size.width * .45,
                  child: Image.asset(
                    "assets/images/head of seb7a.png",
                  ),
                ),
                Positioned(
                  top: 80,
                  right: size.width * .25,
                  left: size.width * .25,
                  child: InkWell(
                    onTap: onPressed,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                        "assets/images/body of seb7a.png",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "عدد التسبيحات",
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            width: 70,
            height: 80,
            decoration: BoxDecoration(
                color: Color(0xFFC9B396),
                borderRadius: BorderRadius.circular(25)),
            child: Text(
              "$counter",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: 137,
            height: 51,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(25)),
            child: Text(
              "${tsbeh[index]}",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  onPressed() {
    angle--;
    counter++;
    if (counter > 33) {
      index++;
      counter = 0;
    }
    if (index > tsbeh.length - 1) {
      index = 0;
      counter = 0;
    }
    setState(() {});
  }
}
