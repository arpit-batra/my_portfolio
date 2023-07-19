import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/section_heights_provider.dart';
import 'package:my_portfolio/widgets/animation/animated_heading.dart';
import 'package:my_portfolio/widgets/heading.dart';
import 'package:my_portfolio/widgets/projects/project.dart';
import 'package:provider/provider.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final _sectionKey = GlobalKey();
  final _project0SectionKey = GlobalKey();
  final _project1SectionKey = GlobalKey();
  final _project2SectionKey = GlobalKey();
  final _projectHeadingSectionKey = GlobalKey();

  @override
  void didChangeDependencies() {
    //For Calculating height of the Section
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SectionHeightsProvider>(context, listen: false)
          .setProjectsSectionHeight(_sectionKey.currentContext!.size!.height);
      Provider.of<SectionHeightsProvider>(context, listen: false)
          .setProject0Height(_project0SectionKey.currentContext!.size!.height);
      Provider.of<SectionHeightsProvider>(context, listen: false)
          .setProject1Height(_project1SectionKey.currentContext!.size!.height);
      Provider.of<SectionHeightsProvider>(context, listen: false)
          .setProject2Height(_project2SectionKey.currentContext!.size!.height);
      Provider.of<SectionHeightsProvider>(context, listen: false)
          .setProjectHeadingHeight(
              _projectHeadingSectionKey.currentContext!.size!.height);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: _sectionKey,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 100,
        ),
        Padding(
          key: _projectHeadingSectionKey,
          padding: const EdgeInsets.all(32.0),
          child: Row(
            children: [
              Expanded(
                child: Container(),
              ),
              const AnimatedHeading(text: "Projects", dark: true),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
        Project(
          key: _project0SectionKey,
          imageLocation: "./assets/projects/reenoScreen.png",
          projectName: "REENO : Badminton Court Booking",
          gitHubLink: "https://github.com/arpit-batra/Reeno",
          playStoreLink:
              "https://play.google.com/store/apps/details?id=com.arpitbatra98.reeno",
          description: const [
            "An Android Application coded in Flutter/Dart that helps in scheduling slots for badminton courts.",
            "It uses Provider package for state management and has two different flavors for two different environments (dev and prod).",
            "Firebase Authentication is used to manage users and Firestore Database for storing slots.",
            "Cloud Functions are used to create API endpoint that authenticates payments with Razorpay and check for any probable conflict before booking the slot in a single transaction."
          ],
          id: 0,
        ),
        const SizedBox(
          height: 80,
        ),
        Project(
            key: _project1SectionKey,
            imageLocation: "./assets/projects/KnuckleSS.png",
            projectName: "Knuckle - Habit Tracker",
            gitHubLink: "https://github.com/arpit-batra/HABIT_TRACKER.git",
            playStoreLink:
                "https://play.google.com/store/apps/details?id=com.arpitbatra98.knuckle",
            description: [
              "An Android Application coded in flutter that helps you build and keep track of new habits",
              "Uses BLoC for State Management and Shared Preferences (Hydrated BLoC) to store data locally",
              "Containse animations and supports for Dark Mode for nice user experience"
            ],
            id: 1),
        const SizedBox(
          height: 80,
        ),
        Project(
          key: _project2SectionKey,
          imageLocation: "./assets/projects/dotJoinSS.png",
          projectName: "DotJoin – Dots and Boxes",
          gitHubLink: "https://github.com/akuldr67/DotJoin",
          playStoreLink:
              "https://play.google.com/store/apps/details?id=com.arpitakuldr.dotjoin",
          description: const [
            "A Java Android Application that replicates the classic dots and boxes board game against AI or friends, both online and offline.",
            "It uses Firebase Realtime Database to create online rooms, which also support room chat.",
            "Added Banner and Interstitial Ads using Google AdMob APIs.",
          ],
          id: 2,
        ),
        const SizedBox(
          height: 80,
        )
      ],
    );
  }
}
