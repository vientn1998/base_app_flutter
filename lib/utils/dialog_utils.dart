import 'package:base_app_flutter/constants/app_theme.dart';
import 'package:base_app_flutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DialogUtils {
  DialogUtils._();
  static showToast({String message, Color backgroundColor, ToastGravity gravity = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor == null ? AppColors.primary : backgroundColor,
      textColor: Colors.white,
      fontSize: 15.0,
    );
  }

  static showCustomDialog({
    String title, String message,
    Function onPressedNo,
    Function onPressedYes}) async{
    return Get.generalDialog(
      pageBuilder: (context, animation, secondaryAnimation) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Get.back();
              },
            ),
            new FlatButton(
              child: new Text("Open"),
              onPressed: onPressedYes,
            ),
          ],
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: false,
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return Transform.scale(
          scale: animation.value,
          child: Opacity(
            opacity: animation.value,
            child: child,
          ),
        );
      },
    );
  }
}