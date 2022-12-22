import 'package:flutter/material.dart';

class SkillWidget extends StatelessWidget {
  final String assetName;
  final String skillName;
  final double imageScale;
  const SkillWidget(
      {required this.assetName,
      required this.skillName,
      required this.imageScale,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Theme.of(context).primaryColor),
          child: Image.asset(
            assetName,
            scale: imageScale,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            skillName,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
