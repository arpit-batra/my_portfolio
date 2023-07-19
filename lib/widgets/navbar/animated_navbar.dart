import 'package:flutter/material.dart';

import 'package:my_portfolio/widgets/navbar/navbar.dart';

class AnimatedNavBar extends StatefulWidget {
  final ScrollController controller;
  final GlobalKey aboutSectionKey;
  final GlobalKey skillsSectionKey;
  final GlobalKey projectsSectionKey;
  final GlobalKey contactSectionKey;
  const AnimatedNavBar(
    this.controller, {
    Key? key,
    required this.aboutSectionKey,
    required this.skillsSectionKey,
    required this.projectsSectionKey,
    required this.contactSectionKey,
  }) : super(key: key);

  @override
  _AnimatedNavBarState createState() => _AnimatedNavBarState();
}

class _AnimatedNavBarState extends State<AnimatedNavBar>
    with TickerProviderStateMixin {
  late AnimationController _ctr;
  late Animation<Offset> _animation;

  @override
  void initState() {
    _ctr = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _animation = Tween<Offset>(begin: Offset(0, -70), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _ctr, curve: Curves.fastOutSlowIn));
    _ctr.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: ((context, child) {
        return Transform.translate(
          offset: _animation.value,
          child: NavBar(widget.controller,
              aboutSectionKey: widget.aboutSectionKey,
              skillsSectionKey: widget.skillsSectionKey,
              projectsSectionKey: widget.projectsSectionKey,
              contactSectionKey: widget.contactSectionKey),
        );
      }),
    );
  }
}
