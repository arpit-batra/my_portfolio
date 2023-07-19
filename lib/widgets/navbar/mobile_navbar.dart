// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/navbar/navbar.dart';
import 'package:flutter/foundation.dart';

class MobileNavbar extends StatefulWidget {
  final ScrollController controller;
  final GlobalKey aboutSectionKey;
  final GlobalKey skillsSectionKey;
  final GlobalKey projectsSectionKey;
  final GlobalKey contactSectionKey;
  const MobileNavbar(
    this.controller, {
    Key? key,
    required this.aboutSectionKey,
    required this.skillsSectionKey,
    required this.projectsSectionKey,
    required this.contactSectionKey,
  }) : super(key: key);

  @override
  _MobileNavbarState createState() => _MobileNavbarState();
}

class _MobileNavbarState extends State<MobileNavbar>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _buttonAnimationController;
  late Animation<double> _boxAnimation,
      _buttonTranslationAnimation,
      _buttonOpacityAnimation;
  late bool _isExpanded;
  late bool _displayButtons;

  @override
  void initState() {
    //Instantiaing Controllers
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _buttonAnimationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    //Instantiating Animations
    _boxAnimation = defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS
        ? Tween<double>(begin: 85, end: 276).animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeOut))
        : Tween<double>(begin: 75, end: 187).animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeOut));
    _buttonTranslationAnimation = Tween<double>(begin: -20, end: 0).animate(
        CurvedAnimation(
            parent: _buttonAnimationController, curve: Curves.easeOut));
    _buttonOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _buttonAnimationController, curve: Curves.easeOut));
    //Instantiating States
    _isExpanded = false;
    _displayButtons = false;
    //AnimationControllerListeners
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _displayButtons = true;
        });
        _buttonAnimationController.forward();
      }
    });

    _buttonAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _displayButtons = false;
        });
        _animationController.reverse();
      }
    });

    super.initState();
  }

  void _handleMenuClick() {
    if (_isExpanded) {
      _buttonAnimationController.reverse();
    } else {
      _animationController.forward();
    }
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void collapseNavBar() {
    _buttonAnimationController.reverse();
    setState(() {
      _isExpanded = false;
    });
  }

  Widget _sectionButton(String text, GlobalKey key) {
    return AnimatedBuilder(
      animation: _buttonOpacityAnimation,
      builder: ((context, child) {
        return Opacity(
          opacity: _buttonOpacityAnimation.value,
          child: Transform.translate(
            offset: Offset(0, _buttonTranslationAnimation.value),
            child: NavBar.sectionButton(
                context, text, widget.controller, key, collapseNavBar),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _boxAnimation,
      builder: ((context, child) {
        return Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          height: _boxAnimation.value,
          decoration: BoxDecoration(
            color: const Color.fromARGB(246, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(color: Theme.of(context).primaryColor, width: 1.2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                NavBar.nameInNavBar(context),
                Row(
                  children: [
                    NavBar.resumeButton(context),
                    IconButton(
                      onPressed: _handleMenuClick,
                      icon: Icon(
                        _isExpanded ? Icons.close : Icons.menu,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ]),
              if (_displayButtons)
                _sectionButton('About Me', widget.aboutSectionKey),
              if (_displayButtons)
                _sectionButton('Skills', widget.skillsSectionKey),
              if (_displayButtons)
                _sectionButton('Projects', widget.projectsSectionKey),
              if (_displayButtons)
                _sectionButton('Contact', widget.contactSectionKey),
            ],
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _buttonAnimationController.dispose();
    super.dispose();
  }
}
