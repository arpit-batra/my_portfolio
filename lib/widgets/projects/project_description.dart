import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/animation/scroll_animated_opacity_widget.dart';

class ProjectDescription extends StatelessWidget {
  final double assumedWidth;
  final List<String> description;
  final isMobile;
  final id;

  const ProjectDescription(
      {required this.id,
      required this.assumedWidth,
      required this.description,
      this.isMobile = false,
      Key? key})
      : super(key: key);

  Widget generalDescription(BuildContext context) {
    String sectionName = "";
    switch (id) {
      case 0:
        sectionName = "Project0";
        break;
      case 1:
        sectionName = "Project1";
        break;
      default:
        break;
    }
    return ScrollAnimatedOpacityWidget(
      section: sectionName,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Theme.of(context).colorScheme.secondary,
            boxShadow: const [
              BoxShadow(offset: Offset(-2, 4), blurRadius: 10)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: description
                .map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "• ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: isMobile ? 18 : assumedWidth * 0.02),
                          ),
                          Expanded(
                            child: Text(
                              e,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      isMobile ? 18 : assumedWidth * 0.02),
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isIdEven = id % 2 == 0;
    if (isMobile) return generalDescription(context);
    return Positioned(
      bottom: 0,
      right: isIdEven ? 0 : 0.1 * assumedWidth,
      left: isIdEven ? 0.1 * assumedWidth : 0,
      child: generalDescription(context),
    );
  }
}
