import 'package:flutter/material.dart';
import 'package:my_portfolio/sections/contact_section.dart';
import 'package:my_portfolio/sections/intro.dart';
import 'package:my_portfolio/sections/about_me_section.dart';
import 'package:my_portfolio/sections/projects_section.dart';
import 'package:my_portfolio/sections/skills_section.dart';
import 'package:my_portfolio/sections/slant_box.dart';
import 'package:my_portfolio/widgets/navbar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(233, 235, 255, 1),
        //Main Column for the whole page
        child: SingleChildScrollView(
          child: Stack(
            children: [
              NavBar(),
              Column(
                children: [
                  Intro(),
                  AboutMeSection(),
                  SkillsSection(),
                  SlantBox(),
                  ProjectsSection(),
                  ContactSection(),
                  Container(
                    height: 10000,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
