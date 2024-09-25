import 'package:fashion_app/src/Products/models/productsmodels.dart';
import 'package:flutter/material.dart';

class productnotofier with ChangeNotifier {
  Products? product;

  void setproduct(Products p) {
    product = p;
    notifyListeners();
  }
}
