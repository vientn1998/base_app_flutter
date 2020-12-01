import 'package:base_app_flutter/constants/app_theme.dart';
import 'package:base_app_flutter/screens/register_screen.dart';
import 'package:provider/provider.dart';
import '../app/import_file_global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("build login");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: AppTheme.text16MediumTitle,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Provider.of<LoginProvider>(context, listen: false)
                    .getUserDetails();
              })
        ],
      ),
      body: Center(
        child: Consumer<LoginProvider>(
          builder: (context, provider, child) {
            print("data: ${provider.userRespo}");
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter the email',
                  ),
                ),
                provider.isValidEmail ? Container() : Text("Invalid Email"),
                sizedBoxHeight(10),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Enter the password',
                  ),
                ),
                provider.isValidPassword
                    ? Container()
                    : Text("Invalid Password"),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<LoginProvider>(context, listen: false)
              .login(emailController.text, passwordController.text);
        },
        tooltip: 'Fetch',
        child: Icon(Icons.check),
      ),
    );
  }
}
