import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String formatDate(bool isRequest) {
    final dateFormatLocale = isRequest ? 'yyyy-MM-dd' : 'dd/MM/yyyy';
    return DateFormat(dateFormatLocale).format(this);
  }
}
