import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/scroll_offset_provider.dart';
import 'package:my_portfolio/providers/section_heights_provider.dart';
import 'package:provider/provider.dart';

class ScrollAnimatedOpacityWidget extends StatelessWidget {
  final Widget child;
  final String section;
  const ScrollAnimatedOpacityWidget(
      {required this.child, required this.section, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final scrollOffset =
        Provider.of<ScrollOffsetProvider>(context).scrollOffset;
    double sectionOffset = 0;
    switch (section) {
      case "About Me":
        sectionOffset =
            Provider.of<SectionHeightsProvider>(context).aboutMeSectionPosition;
        break;
      case "Skills":
        sectionOffset =
            Provider.of<SectionHeightsProvider>(context).skillsSectionPosition;
        break;
      case "Projects":
        sectionOffset =
            Provider.of<SectionHeightsProvider>(context).projectsSectionPostion;
        break;
      case "Project0":
        sectionOffset = Provider.of<SectionHeightsProvider>(context)
            .project0SectionPosition;
        break;
      case "Project1":
        sectionOffset = Provider.of<SectionHeightsProvider>(context)
            .project1SectionPosition;
        break;
      case "Contact":
        sectionOffset = Provider.of<SectionHeightsProvider>(context)
            .contaceMeSectionPosition;
        break;
      default:
        break;
    }

    final maxScrollExtent =
        Provider.of<ScrollOffsetProvider>(context).maxScrollExtent;

    //A
    final startingPoint = sectionOffset - (deviceHeight * 0.8);
    //B
    final endingPoint = sectionOffset - (deviceHeight * 0.3);

    double calculatedOpacity =
        (1 - (scrollOffset - endingPoint) / (startingPoint - endingPoint));
    if (calculatedOpacity < 0) {
      calculatedOpacity = 0;
    }
    if (calculatedOpacity > 1 || scrollOffset == maxScrollExtent) {
      calculatedOpacity = 1;
    }

    return Opacity(
      opacity: calculatedOpacity,
      child: child,
    );
  }
}
