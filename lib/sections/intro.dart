import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/section_heights_provider.dart';
import 'package:provider/provider.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _translationAnimation;
  late Animation<double> _fadeAnimation;
  final _sectionKey = GlobalKey();

  @override
  void didChangeDependencies() {
    //For Calculating height of the Section
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SectionHeightsProvider>(context, listen: false)
          .setIntroSectionHeight(_sectionKey.currentContext!.size!.height);
      // print(_sectionKey.currentContext!.size);
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    _translationAnimation =
        Tween<Offset>(begin: const Offset(-100, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: _animationController, curve: Curves.fastOutSlowIn));

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController, curve: Curves.fastOutSlowIn));

    _animationController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const introTextStyle = TextStyle(fontWeight: FontWeight.w900, fontSize: 64);
    //Color change for Contrast
    var nameTextStyle = const TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 64,
        color: Color.fromRGBO(129, 88, 248, 1));
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    double prefferedWidth = 650;
    return Center(
      key: _sectionKey,
      child: Container(
        height: deviceHeight,
        padding: const EdgeInsets.all(32),
        width: deviceWidth > prefferedWidth ? prefferedWidth : deviceWidth,
        child: AnimatedBuilder(
          animation: _translationAnimation,
          builder: ((context, child) {
            return Transform.translate(
              offset: _translationAnimation.value,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flex(
                      direction: deviceWidth > prefferedWidth
                          ? Axis.horizontal
                          : Axis.vertical,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hi, I'm ",
                          style: introTextStyle,
                        ),
                        Text(
                          "Arpit.",
                          style: nameTextStyle,
                        )
                      ],
                    ),
                    const Text(
                      "I'm a Flutter Developer.",
                      style: introTextStyle,
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
