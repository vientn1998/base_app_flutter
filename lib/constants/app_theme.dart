import 'package:base_app_flutter/constants/colors.dart';
import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  primaryColor: AppColors.primary,
  primaryColorBrightness: Brightness.light,
  brightness: Brightness.light,
  accentColor: Colors.red,
  accentColorBrightness: Brightness.light

);

final ThemeData themeDataDark = ThemeData(
    primaryColor: Colors.red,
    primaryColorBrightness: Brightness.dark,
    brightness: Brightness.dark,
    accentColor: Colors.red,
    accentColorBrightness: Brightness.dark

);