import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/heading.dart';
import 'package:my_portfolio/widgets/skill.dart';

class SkillsSection extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(32.0),
            child: Heading(
              text: "Skills",
              dark: true,
            ),
          ),
          GridView.builder(
            itemBuilder: ((context, index) => SkillWidget(
                  assetName: skillsList[index]["fileName"]!.toString(),
                  skillName: skillsList[index]["skillName"]!.toString(),
                  imageScale:
                      double.parse(skillsList[index]["imageScale"]!.toString()),
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