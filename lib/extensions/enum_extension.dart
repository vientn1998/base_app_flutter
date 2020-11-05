import 'package:base_app_flutter/enum/app_enum.dart';

extension EnumStatusExtension on Status {
  String toEnumString() {
    return this.toString().split('.').last;
  }
}