import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/scroll_offset_provider.dart';
import 'package:my_portfolio/providers/section_heights_provider.dart';
import 'package:provider/provider.dart';

class AnimatedSkill extends StatelessWidget {
  final totalSkills;
  final skillIndex;
  final child;
  const AnimatedSkill(
      {required this.totalSkills,
      required this.skillIndex,
      required this.child,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollOffset =
        Provider.of<ScrollOffsetProvider>(context).scrollOffset;
    final skillScrollOffset =
        Provider.of<SectionHeightsProvider>(context).skillsSectionPosition;
    final screenHeight = MediaQuery.of(context).size.height;

    final scrollOffsetForOneSkill = (0.9 * screenHeight) / totalSkills;

    final startOfAnimation = skillScrollOffset -
        (0.5 * screenHeight) +
        (skillIndex * scrollOffsetForOneSkill);

    final endOfAnimation = startOfAnimation + scrollOffsetForOneSkill;
    double yTranslation = 0;

    if (scrollOffset < startOfAnimation ||
        scrollOffset > startOfAnimation + ((2 / 3) * scrollOffsetForOneSkill)) {
      yTranslation = 0;
    } else if (scrollOffset > startOfAnimation &&
        scrollOffset < startOfAnimation + ((1 / 3) * scrollOffsetForOneSkill)) {
      yTranslation = sqrt(scrollOffset - startOfAnimation) * 3;
    } else if (scrollOffset >
            startOfAnimation + ((1 / 3) * scrollOffsetForOneSkill) &&
        scrollOffset < ((2 / 3) * scrollOffsetForOneSkill)) {
      yTranslation =
          sqrt(((2 / 3) * scrollOffsetForOneSkill) - scrollOffset) * 3;
    }

    return Transform.translate(
      offset: Offset(0, -yTranslation),
      child: child,
    );
  }
}
