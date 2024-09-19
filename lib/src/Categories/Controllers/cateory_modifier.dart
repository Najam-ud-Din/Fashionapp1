import 'package:flutter/material.dart';

class CateoryNotifier with ChangeNotifier {
  String category = " ";
  int _id = 0;

  int get id => _id;

  void setCateory(String val, int id) {
    category = val;
    _id = id;
    notifyListeners();
  }
}
