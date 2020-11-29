import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class LoginProvider extends ChangeNotifier {
  String email;
  String password;
  bool isValidEmail = true;
  bool isValidPassword = true;

  login(String email, String password) {
    this.isValidEmail = isEmail(email);
    this.isValidPassword =
        password.trim().isNotEmpty && password.trim().length >= 6;
    if (this.isValidEmail && this.isValidPassword) {}
    notifyListeners();
  }
}
