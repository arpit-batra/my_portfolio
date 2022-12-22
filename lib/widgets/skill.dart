import 'package:flutter/material.dart';

class SkillWidget extends StatelessWidget {
  final String assetName;
  final String skillName;
  const SkillWidget(
      {required this.assetName, required this.skillName, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Theme.of(context).primaryColor),
          child: Image.asset(
            assetName,
            scale: 2,
          ),
        ),
        Text(
          skillName,
          style: TextStyle(color: Theme.of(context).primaryColor),
        )
      ],
    );
  }
}
