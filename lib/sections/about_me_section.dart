import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/section_heights_provider.dart';
import 'package:my_portfolio/widgets/animation/animated_heading.dart';
import 'package:my_portfolio/widgets/animation/scroll_animated_opacity_widget.dart';
import 'package:my_portfolio/widgets/slant_design_painter.dart';
import 'package:my_portfolio/widgets/heading.dart';
import 'package:provider/provider.dart';

class AboutMeSection extends StatefulWidget {
  const AboutMeSection({Key? key}) : super(key: key);

  @override
  State<AboutMeSection> createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection> {
  final _sectionKey = GlobalKey();

  @override
  void didChangeDependencies() {
    //For Calculating height of the Section
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SectionHeightsProvider>(context, listen: false)
          .setAboutMeSectionHeight(_sectionKey.currentContext!.size!.height);
    });
    super.didChangeDependencies();
  }

  static const MAX_MOBILE_SCREEN_WIDTH = 780.0;
  static const MAX_DESKTOP_SCREEN_WIDTH = 1400.0;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > MAX_DESKTOP_SCREEN_WIDTH)
      screenWidth = MAX_DESKTOP_SCREEN_WIDTH;
    return Stack(
      key: _sectionKey,
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: screenWidth > MAX_MOBILE_SCREEN_WIDTH
              ? 300
              : 575 + ((550 - screenWidth) * (10 / 23)),
          child: CustomPaint(
            painter: SlantDesignPainter(context: context, section: "aboutMe"),
          ),
        ),
        const Positioned(
            top: 10,
            child: AnimatedHeading(
              text: "About Me",
              dark: false,
            )),
        Positioned(
            bottom: 0,
            child: SizedBox(
              // fit: screenWidth > MAX_MOBILE_SCREEN_WIDTH ? BoxFit.fitWidth : BoxFit.fitHeight,
              width: screenWidth,
              height: screenWidth > MAX_MOBILE_SCREEN_WIDTH
                  ? 265
                  : 520 + ((550 - screenWidth) * (10 / 23)),
              child: Flex(
                direction: screenWidth > MAX_MOBILE_SCREEN_WIDTH
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  Expanded(
                    child: Padding(
                      padding: screenWidth > MAX_MOBILE_SCREEN_WIDTH
                          ? const EdgeInsets.all(48.0)
                          : const EdgeInsets.fromLTRB(48, 60, 48, 4),
                      child: const ScrollAnimatedOpacityWidget(
                        section: "About Me",
                        child: Text(
                          "I am a software Engineer with 2 years of working experience. Currently in love with Flutter and exploring new ways in which Mobile Development enables me to make real world impact, specially in the society around me. I love to design UI/UX before heading to code.",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Image.asset(
                    './assets/portfolioPic.png',
                    scale: 3.8,
                  ),
                  if (screenWidth > MAX_MOBILE_SCREEN_WIDTH)
                    const SizedBox(
                      width: 50,
                    ),
                ],
              ),
            ))
      ],
    );

    // Container(
    //   color: Colors.white,
    //   height: 4000,
    //   width: 1000,
    //   // child: Text("Testing"),
    //   child: CustomPaint(
    //     painter: SlantDesignPainter(context: context, section: "skills"),
    //   ),
    // );
  }
}
