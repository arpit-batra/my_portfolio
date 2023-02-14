import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/navbar/navbar.dart';

class DesktopNavbar extends StatelessWidget {
  final ScrollController controller;
  final GlobalKey aboutSectionKey;
  final GlobalKey skillsSectionKey;
  final GlobalKey projectsSectionKey;
  final GlobalKey contactSectionKey;
  const DesktopNavbar(
    this.controller, {
    Key? key,
    required this.aboutSectionKey,
    required this.skillsSectionKey,
    required this.projectsSectionKey,
    required this.contactSectionKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromARGB(246, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).primaryColor, width: 1.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavBar.nameInNavBar(context),
          Row(
            children: [
              NavBar.sectionButton(
                  context, 'About Me', controller, aboutSectionKey, () {}),
              NavBar.divider(context),
              NavBar.sectionButton(
                  context, 'Skills', controller, skillsSectionKey, () {}),
              NavBar.divider(context),
              NavBar.sectionButton(
                  context, 'Projects', controller, projectsSectionKey, () {}),
              NavBar.divider(context),
              NavBar.sectionButton(
                  context, 'Contact', controller, contactSectionKey, () {}),
              NavBar.divider(context),
              NavBar.resumeButton(context)
            ],
          ),
        ],
      ),
    );
  }
}
