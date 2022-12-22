import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/heading.dart';
import 'package:my_portfolio/widgets/skill.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: const Heading(
              text: "Skills",
              dark: true,
            ),
          ),
          GridView.builder(
            itemBuilder: ((context, index) =>
                SkillWidget(assetName: "flutter.png", skillName: "Flutter")),
            itemCount: 3,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 700,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
          ),
        ],
      ),
    );
  }
}
