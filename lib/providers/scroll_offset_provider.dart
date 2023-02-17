import 'package:flutter/material.dart';

class ScrollOffsetProvider with ChangeNotifier {
  double _scrollOffset = 0;
  // ScrollController _scrollController = ScrollController();

  double get scrollOffset {
    final SOffset = _scrollOffset;
    return SOffset;
  }

  // ScrollController get scrollController {
  //   final sController = _scrollController;
  //   return _scrollController;
  // }

  void updateScrollOffset(double newScrollOffset) {
    _scrollOffset = newScrollOffset;
    // print(newScrollOffset);
    notifyListeners();
  }

  // void setScrollController(ScrollController sc) {
  //   _scrollController = sc;
  //   notifyListeners();
  // }
}
