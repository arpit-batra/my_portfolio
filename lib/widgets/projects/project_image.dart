import 'package:flutter/material.dart';

class ProjectImage extends StatelessWidget {
  final bool isIdEven;
  final double assumedWidth;
  final String imageLocation;
  final bool isMobile;

  const ProjectImage(
      {required this.isIdEven,
      required this.assumedWidth,
      required this.imageLocation,
      this.isMobile = false,
      Key? key})
      : super(key: key);

  Widget generalImage() {
    return Container(
      width: 0.2 * assumedWidth,
      height: 0.44 * assumedWidth,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(34)),
        boxShadow: [
          BoxShadow(offset: Offset(-2, 4), blurRadius: 20, spreadRadius: 0)
        ],
      ),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.asset(
          imageLocation,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isMobile) return generalImage();
    return Positioned(
      top: 0,
      left: isIdEven ? 0 : null,
      right: isIdEven ? null : 0,
      child: generalImage(),
    );
  }
}
