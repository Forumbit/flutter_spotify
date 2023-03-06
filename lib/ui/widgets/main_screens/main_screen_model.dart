import 'package:flutter/material.dart';
import 'package:flutter_spotify/resources/resources.dart';

class MainScreenModel extends ChangeNotifier {
  var _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void changeCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
