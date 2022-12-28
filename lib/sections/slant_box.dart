import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/slant_design_painter.dart';

class SlantBox extends StatelessWidget {
  const SlantBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 20,
      child: CustomPaint(
          painter: SlantDesignPainter(context: context, section: "projects")),
    );
  }
}
