import 'package:flutter/cupertino.dart';

class AuthViewModel extends ChangeNotifier {
  bool _passVisibility = false;
  bool get passVisibility => _passVisibility;

  void changeVisibility() {
    _passVisibility = !passVisibility;
    notifyListeners();
  }
}
