import 'package:flutter/material.dart';

class OnBoardingNotifier with ChangeNotifier {
  int _selectedpage = 0;

  int get selectpage => _selectedpage;

  //setter method to set the page value

  set setSelectedPage(int page) {
    _selectedpage = page;
    notifyListeners();
  }
}
