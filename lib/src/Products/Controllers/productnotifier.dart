import 'package:fashion_app/src/Products/models/productsmodels.dart';
import 'package:flutter/material.dart';

class productnotofier with ChangeNotifier {
  Products? product;

  void setproduct(Products p) {
    product = p;
    notifyListeners();
  }

  bool _description = false;

  bool get description => _description;

  void setdescription() {
    _description = !_description;
    notifyListeners();
  }

  void resetdes() {
    _description = false;
  }
}
