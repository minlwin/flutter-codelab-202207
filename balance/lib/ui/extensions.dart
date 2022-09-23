import 'package:intl/intl.dart';

final DateFormat dateFmt = DateFormat("yyyy-MM-dd");
final NumberFormat numFmt = NumberFormat("#,##0");

extension DateToString on DateTime {
  String get label {
    return dateFmt.format(this);
  }
}

extension StringToDate on String {
  DateTime get dateTime {
    return dateFmt.parse(this);
  }
}

extension MyanmarKyat on int {
  String get mmk => "${numFmt.format(this)} MMK";
}
