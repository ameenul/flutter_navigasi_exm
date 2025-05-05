import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  int _currentIndex = 0;
  final PageController controller = PageController();

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    controller.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  void onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
