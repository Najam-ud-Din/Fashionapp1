import 'package:flutter/material.dart';

class colorsizesnotifier with ChangeNotifier {
  String _sizes = "";

  String get sizes => _sizes;

  void setsizes(String size) {
    if (_sizes == size) {
      _sizes = "";
    } else {
      _sizes = size;
    }
    notifyListeners();
  }

  String _color = "";

  String get color => _color;

  void setcolor(String color) {
    if (_color == color) {
      _color = "";
    } else {
      _color = color;
    }

    notifyListeners();
  }
}
