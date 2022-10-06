import 'package:flutter/material.dart';

class RegistrationViewModel extends ChangeNotifier {
  bool _passVisibility = false;
  bool get passVisibility => _passVisibility;

  void changeVisibility() {
    _passVisibility = !passVisibility;
    notifyListeners();
  }
}
