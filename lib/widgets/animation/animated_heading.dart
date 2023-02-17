import 'package:flutter/material.dart';
import 'package:my_portfolio/providers/scroll_offset_provider.dart';
import 'package:my_portfolio/providers/section_heights_provider.dart';
import 'package:my_portfolio/widgets/heading.dart';
import 'package:provider/provider.dart';

class AnimatedHeading extends StatefulWidget {
  final String text;
  final bool dark;
  const AnimatedHeading({required this.text, required this.dark, Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AnimatedHeadingState();
  }
}

class _AnimatedHeadingState extends State<AnimatedHeading> {
  final _headingKey = GlobalKey();
  double _headingWidth = 200;
  double _headingHeight = 40;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _headingWidth = _headingKey.currentContext!.size!.width;
      _headingHeight = _headingKey.currentContext!.size!.height;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _scrollOffset =
        Provider.of<ScrollOffsetProvider>(context).scrollOffset;

    final _deviceHeight = MediaQuery.of(context).size.height;

    double _sectionOffset = 0;
    switch (widget.text) {
      case "About Me":
        _sectionOffset =
            Provider.of<SectionHeightsProvider>(context).aboutMeSectionPosition;
        break;
      case "Skills":
        _sectionOffset =
            Provider.of<SectionHeightsProvider>(context).skillsSectionPosition;
        break;
      case "Projects":
        _sectionOffset =
            Provider.of<SectionHeightsProvider>(context).projectsSectionPostion;
        break;
      case "Contact":
        _sectionOffset = Provider.of<SectionHeightsProvider>(context)
            .contaceMeSectionPosition;
        break;
      default:
        break;
    }

    //A
    final _startingPoint = _sectionOffset - (_deviceHeight * 0.8);
    //B
    final _endingPoint = _sectionOffset - (_deviceHeight * 0.5);

    double _calculatedAnimatedBoxWidth = (_headingWidth + 40) *
        ((_scrollOffset - _endingPoint) / (_startingPoint - _endingPoint));
    if (_calculatedAnimatedBoxWidth < 0) {
      _calculatedAnimatedBoxWidth = 0;
    }
    if (_calculatedAnimatedBoxWidth > (_headingWidth + 40)) {
      _calculatedAnimatedBoxWidth = (_headingWidth + 40);
    }
    // print("${widget.text} -> $_headingWidth");
    return Stack(
      children: [
        Heading(key: _headingKey, text: widget.text, dark: widget.dark),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: widget.dark ? Colors.black : Colors.white),
          width: _calculatedAnimatedBoxWidth,
          height: _headingHeight + 5,
          // child: Heading(text: widget.text, dark: widget.dark),
        ),
      ],
    );
    // }));
  }
}
