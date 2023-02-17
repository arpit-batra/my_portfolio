import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/scroll_offset_provider.dart';
import 'package:my_portfolio/sections/contact_section.dart';
import 'package:my_portfolio/sections/intro.dart';
import 'package:my_portfolio/sections/about_me_section.dart';
import 'package:my_portfolio/sections/projects_section.dart';
import 'package:my_portfolio/sections/skills_section.dart';
import 'package:my_portfolio/sections/slant_box.dart';
import 'package:my_portfolio/widgets/navbar/animated_navbar.dart';
import 'package:my_portfolio/widgets/navbar/navbar.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final aboutSectionKey = GlobalKey();

  final skillsSectionKey = GlobalKey();

  final projectsSectionKey = GlobalKey();

  final contactSectionKey = GlobalKey();

  bool _firstRun = true;

  final controller = ScrollController();

  void onScroll() {
    Provider.of<ScrollOffsetProvider>(context, listen: false)
        .updateScrollOffset(controller.offset);
  }

  @override
  void initState() {
    // Provider.of<ScrollOffsetProvider>(context, listen: false)
    //     .setScrollController(controller);
    controller.addListener(onScroll);
    super.initState();
  }

  // @override
  // void didUpdateWidget(covariant MainPage oldWidget) {
  //   if (_firstRun) {
  //     Provider.of<ScrollOffsetProvider>(context)
  //         .updateScrollOffset(controller.offset);
  //     _firstRun = false;
  //   }
  //   super.didUpdateWidget(oldWidget);
  // }

  // @override
  // void didChangeDependencies() {

  //   super.didChangeDependencies();
  // }

  @override
  void dispose() {
    controller.removeListener(onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
