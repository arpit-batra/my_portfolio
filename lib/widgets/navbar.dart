import 'package:flutter/material.dart';

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

  Widget _sectionButton(BuildContext context, String text, GlobalKey key) {
    return TextButton(
      onPressed: () {
        Scrollable.ensureVisible(key.currentContext!,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutQuad);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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

  static Widget _divider(BuildContext context) {
    return Container(
      width: 1,
      height: 20,
      color: Theme.of(context).primaryColor,
    );
  }

  static Widget _resumeButton(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(
        children: [
          Icon(
            Icons.download,
            color: Theme.of(context).primaryColor,
          ),
          Text(
            "Resume",
            style: TextStyle(color: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }

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
          Row(
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
          ),
          Row(
            children: [
              _sectionButton(context, 'About', aboutSectionKey),
              _divider(context),
              _sectionButton(context, 'Skills', skillsSectionKey),
              _divider(context),
              _sectionButton(context, 'Projects', projectsSectionKey),
              _divider(context),
              _sectionButton(context, 'Contact', contactSectionKey),
              _divider(context),
              _resumeButton(context)
            ],
          )
        ],
      ),
    );
  }
}
