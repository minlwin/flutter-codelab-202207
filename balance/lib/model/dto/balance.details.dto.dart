import 'package:balance/model/dto/balance.dto.dart';
import 'package:balance/model/dto/details.dto.dart';

class BalanceDetails {
  final Balance balance;
  final List<Details> details;

  BalanceDetails({required this.balance, required this.details});
}
