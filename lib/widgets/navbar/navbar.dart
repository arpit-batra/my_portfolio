import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/navbar/desktop_navbar.dart';
import 'package:my_portfolio/widgets/navbar/mobile_navbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
        Dio dio = new Dio();
        String url = await FirebaseStorage.instance
            .ref()
            .child("Personal/RecentResume.pdf")
            .getDownloadURL();
        print(url);
        // print("HEEYYY");
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
    return TextButton(
      onPressed: () {
        Scrollable.ensureVisible(key.currentContext!,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOutQuad,
                alignmentPolicy: ScrollPositionAlignmentPolicy.explicit)
            .then((value) => controller.animateTo(controller.offset - 100,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn))
            .then((value) => f());
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
    bool isMobile = screenWidth < 610;
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
