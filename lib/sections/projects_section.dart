import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/section_heights_provider.dart';
import 'package:my_portfolio/widgets/animation/animated_heading.dart';
import 'package:my_portfolio/widgets/heading.dart';
import 'package:my_portfolio/widgets/project.dart';
import 'package:provider/provider.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final _sectionKey = GlobalKey();

  @override
  void didChangeDependencies() {
    //For Calculating height of the Section
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SectionHeightsProvider>(context, listen: false)
          .setProjectsSectionHeight(_sectionKey.currentContext!.size!.height);
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
          padding: EdgeInsets.all(32.0),
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
        const Project(
          imageLocation: "./assets/projects/reenoScreen.png",
          projectName: "REENO : Badminton Court Booking",
          gitHubLink: "https://github.com/arpit-batra/Reeno",
          playStoreLink:
              "https://play.google.com/store/apps/details?id=com.arpitbatra98.reeno",
          description: [
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
        const Project(
          imageLocation: "./assets/projects/dotJoinSS.png",
          projectName: "DotJoin – Dots and Boxes",
          gitHubLink: "https://github.com/akuldr67/DotJoin",
          playStoreLink:
              "https://play.google.com/store/apps/details?id=com.arpitakuldr.dotjoin",
          description: [
            "A Java Android Application that replicates the classic dots and boxes board game against AI or friends, both online and offline.",
            "It uses Firebase Realtime Database to create online rooms, which also support room chat.",
            "Added Banner and Interstitial Ads using Google AdMob APIs.",
          ],
          id: 1,
        ),
        const SizedBox(
          height: 80,
        )
      ],
    );
  }
}
