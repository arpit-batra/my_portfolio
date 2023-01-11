import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const introTextStyle = TextStyle(fontWeight: FontWeight.w900, fontSize: 64);
    //Color change for Contrast
    var nameTextStyle = TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 64,
        color: Theme.of(context).accentColor);
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    double prefferedWidth = 650;
    return Center(
      child: Container(
        height: deviceHeight,
        padding: const EdgeInsets.all(32),
        width: deviceWidth > prefferedWidth ? prefferedWidth : deviceWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flex(
              direction: deviceWidth > prefferedWidth
                  ? Axis.horizontal
                  : Axis.vertical,
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hi, I'm ",
                  style: introTextStyle,
                ),
                Text(
                  "Arpit.",
                  style: nameTextStyle,
                )
              ],
            ),
            const Text(
              "I'm a Flutter Developer.",
              style: introTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
