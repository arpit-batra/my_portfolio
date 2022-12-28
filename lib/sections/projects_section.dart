import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/heading.dart';
import 'package:my_portfolio/widgets/project.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox(
          height: 150,
        ),
        Padding(
          padding: EdgeInsets.all(32.0),
          child: Heading(text: "Projects", dark: true),
        ),
        Project(
          imageLocation: "./assets/projects/reenoScreen.png",
          projectName: "REENO : Badminton Court Booking",
          gitHubLink: "",
          playStoreLink: "",
          description:
              "An Android Application coded in Flutter/Dart that helps in scheduling slots for badminton courts. It uses Provider package for state management and has two different flavors for two different environments (dev and prod) Firebase Authentication is used to manage users and Firestore Database for storing slots. Cloud Functions are used to create API endpoint that authenticates payments with Razorpay and check for any probable conflict before booking the slot in a single transaction.",
          id: 0,
        ),
        SizedBox(
          height: 120,
        ),
        Project(
          imageLocation: "./projects/dotJoinSS.png",
          projectName: "DotJoin – Dots and Boxes",
          gitHubLink: "https://github.com/akuldr67/DotJoin",
          playStoreLink:
              "https://play.google.com/store/apps/details?id=com.arpitakuldr.dotjoin",
          description: "",
          id: 1,
        )
      ],
    );
  }
}
