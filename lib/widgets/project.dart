import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Project extends StatelessWidget {
  final String imageLocation;
  final String projectName;
  final String gitHubLink;
  final String playStoreLink;
  final String description;
  final int id;
  const Project(
      {required this.imageLocation,
      required this.projectName,
      required this.gitHubLink,
      required this.playStoreLink,
      required this.description,
      required this.id,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isIdEven = id % 2 == 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 500,
          height: 460,
          constraints: const BoxConstraints(
              minWidth: 100, maxWidth: 500, maxHeight: 600, minHeight: 400),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: 0,
                  left: isIdEven ? 0 : null,
                  right: isIdEven ? null : 0,
                  child: Container(
                      // color: Colors.blue[800],
                      width: 200,
                      height: 440,
                      constraints: const BoxConstraints(
                          minWidth: 100,
                          maxWidth: 300,
                          maxHeight: 600,
                          minHeight: 400),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(34)),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(-2, 4),
                              blurRadius: 20,
                              spreadRadius: 0)
                        ],
                        // color: Colors.blue[800]
                        // image: DecorationImage(
                        //     image: AssetImage(imageLocation))
                      ),
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.asset(
                          imageLocation,
                        ),
                      ))),
              Positioned(
                bottom: 0,
                right: isIdEven ? 0 : 100,
                left: isIdEven ? 100 : 0,
                child: Container(
                  // color: Colors.blue[800],
                  width: 500,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Theme.of(context).colorScheme.secondary,
                      boxShadow: const [
                        BoxShadow(offset: Offset(-2, 4), blurRadius: 10)
                      ]),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      " - An Android Application coded in Flutter/Dart that helps in scheduling slots for badminton courts.\n - It uses Provider package for state management and has two different flavors for two different environments (dev and prod)\n - Firebase Authentication is used to manage users and Firestore Database for storing slots.\n - Cloud Functions are used to create API endpoint that authenticates payments with Razorpay and check for any probable conflict before booking the slot in a single transaction.",
                      overflow: TextOverflow.clip,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  left: isIdEven ? 200 : null,
                  right: isIdEven ? null : 200,
                  child: SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        // crossAxisAlignment: isIdEven
                        //     ? CrossAxisAlignment.start
                        //     : CrossAxisAlignment.end,
                        children: [
                          Text(
                            projectName,
                            textAlign:
                                isIdEven ? TextAlign.start : TextAlign.end,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w900,
                                fontSize: 24),
                          ),
                          Row(
                            mainAxisAlignment: isIdEven
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                      '/projects/Icons/github.svg')),
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                      '/projects/Icons/googlePlay.svg')),
                            ],
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
