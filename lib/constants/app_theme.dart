import 'package:base_app_flutter/constants/colors.dart';
import 'package:base_app_flutter/constants/font_family.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static final ThemeData themeData = ThemeData(
      primaryColor: AppColors.primary,
      primaryColorBrightness: Brightness.light,
      brightness: Brightness.light,
      accentColor: Colors.red,
      fontFamily: FontFamily.robotoRegular,
      accentColorBrightness: Brightness.light

  );

  static final ThemeData themeDataDark = ThemeData(
      primaryColor: AppColors.primary,
      primaryColorBrightness: Brightness.dark,
      brightness: Brightness.dark,
      accentColor: Colors.red,
      fontFamily: FontFamily.robotoRegular,
      accentColorBrightness: Brightness.dark
  );

  static const TextStyle text16Medium = TextStyle(
    fontFamily: FontFamily.robotoMedium,
    fontSize: 16,
    color: AppColors.text,
  );

  static const TextStyle text16MediumTitle = TextStyle(
    fontFamily: FontFamily.robotoMedium,
    fontSize: 16,
    color: AppColors.title,
  );
}



