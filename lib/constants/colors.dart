import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _appColors = AppColors._();
  factory AppColors() {
    return _appColors;
  }
  AppColors._();
  static const primary = Color(0xff304ffe);
  static const text = Color(0xFF555557);
  static const title = Color(0xFF111114);
}