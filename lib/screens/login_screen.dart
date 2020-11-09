import 'package:base_app_flutter/constants/app_theme.dart';
import 'package:base_app_flutter/screens/register_screen.dart';
import 'package:base_app_flutter/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login", style: AppTheme.text16MediumTitle,),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {
            Get.to(LoginScreen());
          })
        ],
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1/1,
          child: Image.asset(StringUtils.getUrlAssets("ic_sms"), height: 200, width: 200,),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.back();
        },
        tooltip: 'Fetch',
        child: Icon(Icons.add),
      ),
    );
  }
}
