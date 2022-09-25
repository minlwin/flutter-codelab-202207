import 'package:intl/intl.dart';

class DateTimeUtils {
  static final DateFormat _dateFormat = DateFormat("yyyy-MM-dd");

  DateTimeUtils._();

  static String format(DateTime? date) {
    if (null != date) {
      return _dateFormat.format(date);
    }
    return "";
  }

  static DateTime? parse(String? str) {
    if (null != str && str.isNotEmpty) {
      return _dateFormat.parse(str);
    }
    return null;
  }

  static int? toInt(DateTime? date) {
    if (null != date) {
      return date.millisecondsSinceEpoch;
    }
    return null;
  }

  static DateTime? fromInt(int? value) {
    if (null != value) {
      return DateTime.fromMillisecondsSinceEpoch(value);
    }
    return null;
  }
}
