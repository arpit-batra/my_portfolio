import 'package:flutter/material.dart';
import 'package:my_portfolio/sections/contact_section.dart';
import 'package:my_portfolio/sections/intro.dart';
import 'package:my_portfolio/sections/about_me_section.dart';
import 'package:my_portfolio/sections/projects_section.dart';
import 'package:my_portfolio/sections/skills_section.dart';
import 'package:my_portfolio/sections/slant_box.dart';
import 'package:my_portfolio/widgets/navbar/animated_navbar.dart';
import 'package:my_portfolio/widgets/navbar/navbar.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final aboutSectionKey = GlobalKey();
  final skillsSectionKey = GlobalKey();
  final projectsSectionKey = GlobalKey();
  final contactSectionKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          color: const Color.fromRGBO(233, 235, 255, 1),
          //Main Column for the whole page
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: controller,
                child: Column(
                  children: [
                    Intro(),
                    AboutMeSection(
                      key: aboutSectionKey,
                    ),
                    SkillsSection(
                      key: skillsSectionKey,
                    ),
                    const SlantBox(),
                    ProjectsSection(
                      key: projectsSectionKey,
                    ),
                    ContactSection(
                      key: contactSectionKey,
                    ),
                  ],
                ),
              ),
              AnimatedNavBar(
                controller,
                aboutSectionKey: aboutSectionKey,
                skillsSectionKey: skillsSectionKey,
                projectsSectionKey: projectsSectionKey,
                contactSectionKey: contactSectionKey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
