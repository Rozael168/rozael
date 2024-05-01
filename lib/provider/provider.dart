import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  List product = [];

  addItem(dynamic index) {
    product.add(index);

    notifyListeners();
  }
}
