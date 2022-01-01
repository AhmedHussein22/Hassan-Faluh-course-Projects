import 'package:flutter/material.dart';

class Count extends ChangeNotifier {
  int count = 2;
  counter() {
    count += 2;
    notifyListeners();
  }
}
