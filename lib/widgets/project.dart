import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/projects/project_description.dart';
import 'package:my_portfolio/widgets/projects/project_image.dart';
import 'package:my_portfolio/widgets/projects/project_title.dart';

class Project extends StatelessWidget {
  final String imageLocation;
  final String projectName;
  final String gitHubLink;
  final String playStoreLink;
  final List<String> description;
  final int id;
  const Project(
      {required this.imageLocation,
      required this.projectName,
      required this.gitHubLink,
      required this.playStoreLink,
      required this.description,
      required this.id,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isIdEven = id % 2 == 0;
    final assumedWidth = MediaQuery.of(context).size.width < 800
        ? MediaQuery.of(context).size.width - 32.0 // -32 for margin
        : 768.0; //88-32(margin)
    final isMobile = assumedWidth < 400 ? true : false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: assumedWidth,
          height: !isMobile ? 0.92 * assumedWidth : null,
          child: isMobile
              ? Column(
                  children: [
                    ProjectTitle(
                      isIdEven: isIdEven,
                      assumedWidth: assumedWidth,
                      projectName: projectName,
                      gitHubLink: gitHubLink,
                      playStoreLink: playStoreLink,
                      isMobile: true,
                    ),
                    ProjectImage(
                      isIdEven: isIdEven,
                      assumedWidth: assumedWidth,
                      imageLocation: imageLocation,
                      isMobile: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ProjectDescription(
                      isIdEven: isIdEven,
                      assumedWidth: assumedWidth,
                      description: description,
                      isMobile: true,
                    ),
                  ],
                )
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    ProjectImage(
                        isIdEven: isIdEven,
                        assumedWidth: assumedWidth,
                        imageLocation: imageLocation),
                    ProjectDescription(
                        isIdEven: isIdEven,
                        assumedWidth: assumedWidth,
                        description: description),
                    ProjectTitle(
                        isIdEven: isIdEven,
                        assumedWidth: assumedWidth,
                        projectName: projectName,
                        gitHubLink: gitHubLink,
                        playStoreLink: playStoreLink),
                  ],
                ),
        ),
      ],
    );
  }
}
