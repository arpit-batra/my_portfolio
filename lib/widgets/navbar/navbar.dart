import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/section_heights_provider.dart';
import 'package:my_portfolio/widgets/animation/animated_button.dart';
import 'package:my_portfolio/widgets/navbar/desktop_navbar.dart';
import 'package:my_portfolio/widgets/navbar/mobile_navbar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  final ScrollController controller;
  final GlobalKey aboutSectionKey;
  final GlobalKey skillsSectionKey;
  final GlobalKey projectsSectionKey;
  final GlobalKey contactSectionKey;
  const NavBar(
    this.controller, {
    Key? key,
    required this.aboutSectionKey,
    required this.skillsSectionKey,
    required this.projectsSectionKey,
    required this.contactSectionKey,
  }) : super(key: key);

  static Widget divider(BuildContext context) {
    return Container(
      width: 1,
      height: 20,
      color: Theme.of(context).primaryColor,
    );
  }

  static Widget nameInNavBar(BuildContext context) {
    return Row(
      children: [
        Text(
          "Arpit",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 26,
              fontWeight: FontWeight.w100),
        ),
        const Text(" "),
        Text("Batra",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 26))
      ],
    );
  }

  static Widget resumeButton(BuildContext context) {
    return TextButton(
      onPressed: () async {
        String url = await FirebaseStorage.instance
            .ref()
            .child("Personal/RecentResume.pdf")
            .getDownloadURL();
        await launchUrl(Uri.parse(url));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).primaryColor,
        ),
        child: Row(
          children: const [
            Icon(
              Icons.download,
              color: Colors.white,
              size: 16,
            ),
            Text(
              "Resume",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  static Widget sectionButton(
    BuildContext context,
    String text,
    ScrollController controller,
    GlobalKey key,
    Function f,
  ) {
    return AnimatedButton(
      onPressed: () {
        double scrollOffset = 0;
        switch (text) {
          case "About Me":
            scrollOffset =
                Provider.of<SectionHeightsProvider>(context, listen: false)
                    .aboutMeSectionPosition;
            break;
          case "Skills":
            scrollOffset =
                Provider.of<SectionHeightsProvider>(context, listen: false)
                    .skillsSectionPosition;
            break;
          case "Projects":
            scrollOffset =
                Provider.of<SectionHeightsProvider>(context, listen: false)
                    .projectsSectionPostion;
            break;
          case "Contact":
            scrollOffset =
                Provider.of<SectionHeightsProvider>(context, listen: false)
                    .contaceMeSectionPosition;
            break;
          default:
            break;
        }
        controller
            .animateTo(scrollOffset - 100,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut)
            .then((value) => f());

        // Scrollable.ensureVisible(key.currentContext!,
        //         duration: const Duration(milliseconds: 600),
        //         curve: Curves.easeOutQuad,
        //         alignmentPolicy: ScrollPositionAlignmentPolicy.explicit)
        //     .then((value) => controller.animateTo(controller.offset - 100,
        //         duration: const Duration(milliseconds: 200),
        //         curve: Curves.easeIn))
        //     .then((value) => f());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Text(
          text,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w100),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 710;
    if (!isMobile) {
      return DesktopNavbar(controller,
          aboutSectionKey: aboutSectionKey,
          skillsSectionKey: skillsSectionKey,
          projectsSectionKey: projectsSectionKey,
          contactSectionKey: contactSectionKey);
    }
    return MobileNavbar(controller,
        aboutSectionKey: aboutSectionKey,
        skillsSectionKey: skillsSectionKey,
        projectsSectionKey: projectsSectionKey,
        contactSectionKey: contactSectionKey);
  }
}
