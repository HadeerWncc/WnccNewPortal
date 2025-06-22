import 'package:flutter/material.dart';

class ChangePageName extends ChangeNotifier {
  /// Internal, private state of the cart.
  String pageName = "Home";

  void change(String newPageName) {
    pageName = newPageName;
    notifyListeners();
  }
}
