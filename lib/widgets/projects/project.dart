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
        ? MediaQuery.of(context).size.width - 34.0 // -32 for margin
        : 767.0; //800-32(margin)
    final isMobile = assumedWidth < 600 ? true : false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          // padding: const EdgeInsets.all(16),
          width: assumedWidth,
          height: !isMobile ? 0.46 * assumedWidth : null,
          // color: Colors.amber,
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
                      id: id,
                      assumedWidth: assumedWidth,
                      imageLocation: imageLocation,
                      isMobile: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ProjectDescription(
                      id: id,
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
                        id: id,
                        assumedWidth: assumedWidth,
                        imageLocation: imageLocation),
                    ProjectDescription(
                        id: id,
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
