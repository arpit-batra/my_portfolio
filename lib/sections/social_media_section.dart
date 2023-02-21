import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //Twitter
          IconButton(
              onPressed: () {
                launchUrl(Uri.parse('https://twitter.com/Arpit__Batra'));
              },
              icon: SvgPicture.asset(
                './assets/SMIcons/twitter.svg',
                color: Color.fromRGBO(233, 235, 255, 1),
              )),
          //GitHub
          IconButton(
              onPressed: () {
                launchUrl(Uri.parse('https://github.com/arpit-batra'));
              },
              icon: SvgPicture.asset(
                './assets/SMIcons/github.svg',
                color: Color.fromRGBO(233, 235, 255, 1),
              )),
          //Linkedin
          IconButton(
            onPressed: () {
              launchUrl(Uri.parse('https://www.linkedin.com/in/arpit-batra2/'));
            },
            icon: SvgPicture.asset('./assets/SMIcons/linkedin.svg'),
            color: Color.fromRGBO(233, 235, 255, 1),
          ),
          const SizedBox(
            width: 40,
          )
        ],
      ),
    );
  }
}
