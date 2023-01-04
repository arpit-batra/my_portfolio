import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProjectTitle extends StatelessWidget {
  final bool isIdEven;
  final double assumedWidth;
  final String projectName;
  final String gitHubLink;
  final String playStoreLink;
  final bool isMobile;

  const ProjectTitle(
      {required this.isIdEven,
      required this.assumedWidth,
      required this.projectName,
      required this.gitHubLink,
      required this.playStoreLink,
      this.isMobile = false,
      Key? key})
      : super(key: key);

  Widget generalTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.start
            : isIdEven
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
        children: [
          Text(
            projectName,
            textAlign: isIdEven ? TextAlign.start : TextAlign.end,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: isMobile ? 32 : assumedWidth * 0.04),
          ),
          Row(
            mainAxisAlignment: isMobile
                ? MainAxisAlignment.start
                : isIdEven
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('/projects/Icons/github.svg')),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('/projects/Icons/googlePlay.svg')),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isMobile) return generalTitle(context);
    return Positioned(
      top: 0,
      left: isIdEven ? 0.4 * assumedWidth : null,
      right: isIdEven ? null : 0.4 * assumedWidth,
      child: SizedBox(
        // color: Colors.amber,
        width: 0.6 * assumedWidth,
        child: generalTitle(context),
      ),
    );
  }
}
