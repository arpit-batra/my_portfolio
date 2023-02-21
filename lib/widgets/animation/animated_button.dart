import 'package:flutter/material.dart';

const BUTTON_WIDTH = 100.0;

class AnimatedButton extends StatefulWidget {
  final void Function()? onPressed;
  final Widget child;

  const AnimatedButton({this.onPressed, required this.child, Key? key})
      : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  late AnimationController _firstController;
  late AnimationController _secondController;
  late Animation<double> _firstAnimation;
  late Animation<double> _secondTranslationAnimation;
  final GlobalKey _buttonKey = GlobalKey();

  @override
  void initState() {
    _firstController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _secondController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _firstAnimation = Tween<double>(begin: 0, end: BUTTON_WIDTH).animate(
        CurvedAnimation(parent: _firstController, curve: Curves.easeInOut));

    _secondTranslationAnimation = Tween<double>(begin: 0, end: BUTTON_WIDTH)
        .animate(CurvedAnimation(
            parent: _secondController, curve: Curves.easeInOut));

    _firstController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _secondController.forward();
        _firstController.reverse();
      }
    });

    _secondController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _firstController.reset();
        _secondController.reset();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: BUTTON_WIDTH,
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          // shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        key: _buttonKey,
        onPressed: widget.onPressed,
        onHover: (val) {
          if (val) {
            _firstController.forward();
          }
        },
        child: Stack(
          children: [
            AnimatedBuilder(
                animation: _secondTranslationAnimation,
                builder: (context, child) {
                  return AnimatedBuilder(
                      animation: _firstAnimation,
                      builder: ((context, child) {
                        return Transform.translate(
                            offset:
                                Offset(_secondTranslationAnimation.value, 0),
                            child: Container(
                              color: const Color.fromRGBO(233, 235, 255, 1),
                              height: 20,
                              width: _firstAnimation.value,
                            ));
                      }));
                }),
            widget.child,
          ],
        ),
      ),
    );
  }
}
