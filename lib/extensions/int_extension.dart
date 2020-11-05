import 'package:intl/intl.dart';

extension IntExtension on int {
  DateTime convertDatetime() {
    return DateTime.fromMillisecondsSinceEpoch(this) ?? DateTime.now();
  }
  String formatPrice() {
    final numberFormat = NumberFormat("###,###,###");
    return numberFormat.format(this) + " đ";
  }
  String formatPriceNonUnit() {
    final numberFormat = NumberFormat("###,###,###");
    return numberFormat.format(this);
  }
  String formatNumber() {
    return this < 10 ? "0$this" : "$this";
  }
}