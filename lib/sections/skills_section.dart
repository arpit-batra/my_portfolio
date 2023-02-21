import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/section_heights_provider.dart';
import 'package:my_portfolio/widgets/animation/animated_heading.dart';
import 'package:my_portfolio/widgets/animation/animated_skill.dart';
import 'package:my_portfolio/widgets/heading.dart';
import 'package:my_portfolio/widgets/skill.dart';
import 'package:provider/provider.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({Key? key}) : super(key: key);
  static const skillsList = [
    {
      "fileName": "./assets/skills/flutter.png",
      "skillName": "Flutter",
      "imageScale": 4
    },
    {
      "fileName": "./assets/skills/dart.png",
      "skillName": "Dart",
      "imageScale": 12
    },
    {
      "fileName": "./assets/skills/firebase.png",
      "skillName": "Firebase",
      "imageScale": 3
    },
    {
      "fileName": "./assets/skills/git.png",
      "skillName": "Git",
      "imageScale": 4
    },
    {
      "fileName": "./assets/skills/cpp.png",
      "skillName": "C++",
      "imageScale": 10
    },
    {
      "fileName": "./assets/skills/python.png",
      "skillName": "Python",
      "imageScale": 3.3
    },
    {
      "fileName": "./assets/skills/jenkins.png",
      "skillName": "Jenkins",
      "imageScale": 9
    },
  ];

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  final _sectionKey = GlobalKey();

  @override
  void didChangeDependencies() {
    //For Calculating height of the Section
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SectionHeightsProvider>(context, listen: false)
          .setSkillsSectionHeight(_sectionKey.currentContext!.size!.height);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _sectionKey,
      width: MediaQuery.of(context).size.width > 1400
          ? 1400
          : MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                const AnimatedHeading(
                  text: "Skills",
                  dark: true,
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
          GridView.builder(
            itemBuilder: ((context, index) => AnimatedSkill(
                  skillIndex: index,
                  totalSkills: 7,
                  child: SkillWidget(
                    assetName:
                        SkillsSection.skillsList[index]["fileName"]!.toString(),
                    skillName: SkillsSection.skillsList[index]["skillName"]!
                        .toString(),
                    imageScale: double.parse(SkillsSection.skillsList[index]
                            ["imageScale"]!
                        .toString()),
                  ),
                )),
            itemCount: 7,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
                mainAxisExtent: 220,
                mainAxisSpacing: 0),
          ),
        ],
      ),
    );
  }
}
