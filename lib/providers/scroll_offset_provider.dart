import 'package:flutter/material.dart';

class ScrollOffsetProvider with ChangeNotifier {
  double _scrollOffset = 0;
  double _maxScrollExtent = 0;
  // ScrollController _scrollController = ScrollController();

  double get scrollOffset {
    final SOffset = _scrollOffset;
    return SOffset;
  }

  double get maxScrollExtent {
    final tempMSE = _maxScrollExtent;
    return tempMSE;
  }

  // ScrollController get scrollController {
  //   final sController = _scrollController;
  //   return _scrollController;
  // }

  void updateMaxScrollExtent(double mse) {
    _maxScrollExtent = mse;
    notifyListeners();
  }

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
