import 'package:flutter/material.dart';

class UserController extends ChangeNotifier {
  bool registerUser = true;
  void updateRegisteruser(bool status) {
    registerUser = status;
    notifyListeners();
  }
}
