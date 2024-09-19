import 'package:flutter/material.dart';

class tabindexnotifier with ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void setindex(int index) {
    _index = index;
    notifyListeners();
  }
}
