import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  Widget _sectionButton(BuildContext context, String text) {
    return TextButton(
      onPressed: () {},
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
    // return IconButton(onPressed: () {}, icon: Icon(Icons.download),);
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
              _sectionButton(context, 'About'),
              _divider(context),
              _sectionButton(context, 'Skills'),
              _divider(context),
              _sectionButton(context, 'Projects'),
              _divider(context),
              _sectionButton(context, 'Contact'),
              _divider(context),
              _resumeButton(context)
              // _sectionButton(context, 'about'),
              // _divider(context),
            ],
          )
        ],
      ),
    );
  }
}
