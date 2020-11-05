import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {

  String formatTimeString() {
    return DateFormat('HH:mm').format(this);
  }

  String formatMonthYearString() {
    return DateFormat('MMM, yyyy').format(this);
  }

  String formatDateTimeString() {
    return DateFormat('dd/MM/yyyy HH:mm').format(this);
  }

  String formatTimeDateString() {
    return DateFormat('HH:mm dd/MM/yyyy').format(this);
  }

  String formatDayString() {
    return DateFormat('dd').format(this);
  }

  String formatMonthString() {
    return DateFormat('MMM').format(this);
  }

  String formatDateDefault() {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}