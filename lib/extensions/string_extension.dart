
import 'package:base_app_flutter/enum/app_enum.dart';
import '../extensions/enum_extension.dart';

extension StringExtension on String {
  Status toCastStringIntoEnum() {
    if (this.toString() == Status.New.toEnumString()) {
      return Status.New;
    }
    return Status.Canceled;
  }

  String stringValue() {
    if (this == null || this.isEmpty) {
      return "Chưa cập nhật";
    }
    return this;
  }

  String stringNotYetUpdate() {
    if (this == null || this.isEmpty) {
      return "Chưa cập nhật";
    }
    return this;
  }
}
