import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/scroll_offset_provider.dart';
import 'package:my_portfolio/providers/section_heights_provider.dart';
import 'package:provider/provider.dart';

class ProjectImage extends StatelessWidget {
  final int id;
  final double assumedWidth;
  final String imageLocation;
  final bool isMobile;

  const ProjectImage(
      {required this.id,
      required this.assumedWidth,
      required this.imageLocation,
      this.isMobile = false,
      Key? key})
      : super(key: key);

  Widget generalImage() {
    return Container(
      width: isMobile ? 200 : 0.2 * assumedWidth,
      height: isMobile ? 440 : 0.44 * assumedWidth,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(34)),
        boxShadow: [
          BoxShadow(offset: Offset(-2, 4), blurRadius: 20, spreadRadius: 0)
        ],
      ),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.asset(
          imageLocation,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isIdEven = id % 2 == 0;
    //Getting Params required for animation
    final deviceHeight = MediaQuery.of(context).size.height;
    final scrollOffset =
        Provider.of<ScrollOffsetProvider>(context).scrollOffset;

    double sectionOffset = 0;

    switch (id) {
      case 0:
        sectionOffset = Provider.of<SectionHeightsProvider>(context)
            .project0SectionPosition;
        break;
      case 1:
        sectionOffset = Provider.of<SectionHeightsProvider>(context)
            .project1SectionPosition;
        break;
      default:
        break;
    }

    // print("id -> $id -------- sectionOffset -> $sectionOffset");
    // print("id -> $id -------- sectionOffset -> $sectionOffset");

    //A
    final startingPoint = sectionOffset - (deviceHeight * 0.8);
    //B
    final endingPoint = sectionOffset - (deviceHeight * 0.4);
    final maxScrollExtent =
        Provider.of<ScrollOffsetProvider>(context).maxScrollExtent;

    double calculatedOpacity =
        (1 - (scrollOffset - endingPoint) / (startingPoint - endingPoint));
    if (calculatedOpacity < 0) {
      calculatedOpacity = 0;
    }
    if (calculatedOpacity > 1 || scrollOffset == maxScrollExtent) {
      calculatedOpacity = 1;
    }

    double calculatedyOffset =
        ((scrollOffset - endingPoint) * 400) / (startingPoint - endingPoint);
    if (calculatedyOffset < 0) {
      calculatedyOffset = 0;
    }
    if (calculatedyOffset > 400) {
      calculatedyOffset = 400;
    }

    if (isMobile) {
      return Transform.translate(
          offset: Offset(0, calculatedyOffset),
          child: Opacity(opacity: calculatedOpacity, child: generalImage()));
    }
    return Positioned(
      top: calculatedyOffset,
      left: isIdEven ? 0 : null,
      right: isIdEven ? null : 0,
      child: Opacity(opacity: calculatedOpacity, child: generalImage()),
    );
  }
}
