import 'package:balance/model/dto/balance.dto.dart';
import 'package:intl/intl.dart';

class BalanceListState {
  List<Balance> _result = List.empty();

  set result(List<Balance> list) {
    _result = list;
  }

  int get _total =>
      _result.isEmpty ? 0 : _result.map((e) => e.total).reduce((a, b) => a + b);

  String get total => "${NumberFormat('#,##0').format(_total)} MMK";
}
