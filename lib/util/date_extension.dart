import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {

  String get monthName {
    return DateFormat("MMMM").format(this);
  }
  String get getDateTimestr {
    return DateFormat('yyyy-MM-dd hh:mm:ss a').format(this);
}
}
