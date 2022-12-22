import 'package:flutter/material.dart';
import 'dart:core';

class Heading extends StatelessWidget {
  final String text;
  final bool dark;
  const Heading({required this.text, required this.dark, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int divideIndex = (text.length * 0.7).floor();
    final firstHalf = text.substring(0, divideIndex);
    final secondHalf = text.substring(divideIndex);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstHalf,
          style: TextStyle(
              // color: Colors.white,
              fontSize: 32,
              decoration: TextDecoration.underline,
              shadows: [
                Shadow(
                    color: dark ? Colors.black : Colors.white,
                    offset: const Offset(0, -8))
              ],
              color: Colors.transparent,
              decorationColor: dark ? Colors.black : Colors.white,
              decorationThickness: 1),
        ),
        Text(
          secondHalf,
          style: TextStyle(
              // color: Colors.white,
              fontSize: 32,
              shadows: [
                Shadow(
                    color: dark ? Colors.black : Colors.white,
                    offset: const Offset(0, -8))
              ],
              color: Colors.transparent,
              decorationColor: dark ? Colors.black : Colors.white,
              fontWeight: FontWeight.w900,
              decoration: TextDecoration.underline,
              decorationThickness: 3),
        )
      ],
    );
    // return Container(
    //   color: Colors.amber,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Text(text),
    //       Row(
    //         mainAxisSize: MainAxisSize.values[]],
    //         children: [
    //           Expanded(
    //             flex: 5,
    //             child: Container(
    //               color: Colors.black,
    //               height: 1,
    //               width: 3,
    //             ),
    //           ),
    //           Expanded(
    //             flex: 2,
    //             child: Container(
    //               width: 2,
    //               color: Colors.black,
    //               height: 4,
    //             ),
    //           )
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}
