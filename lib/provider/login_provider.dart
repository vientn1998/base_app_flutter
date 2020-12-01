import 'package:base_app_flutter/data/services/api_responese.dart';
import 'package:base_app_flutter/data/services/login/login_repository.dart';
import 'package:base_app_flutter/enum/app_enum.dart';
import 'package:base_app_flutter/models/user_obj.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

String token = "";

class LoginProvider extends ChangeNotifier {
  String email;
  String password;
  bool isValidEmail = true;
  bool isValidPassword = true;
  UserObj userObj;

  LoginRespository _loginRespository;
  ApiResponse<UserObj> userRespo;

  LoginProvider() {
    _loginRespository = LoginRespository();
  }

  login(String email, String password) async {
    // this.isValidEmail = isEmail(email);
    // this.isValidPassword =
    //     password.trim().isNotEmpty && password.trim().length >= 6;
    if (this.isValidEmail && this.isValidPassword) {
      userRespo = ApiResponse.loading();
      notifyListeners();
      userRespo = await _loginRespository.login();
      if (userRespo.status == ApiStatus.COMPLETED) {
        userObj = userRespo.data;
        token = userRespo.data.jwtToken;
      }
      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  getUserDetails() async {
    userRespo = ApiResponse.loading();
    notifyListeners();
    userRespo = await _loginRespository.getUserDetail();
  }
}
