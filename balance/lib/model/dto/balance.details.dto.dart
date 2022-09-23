import 'package:balance/model/dto/balance.dto.dart';
import 'package:balance/model/dto/details.dto.dart';

class BalanceWidthDetails {
  final Balance balance;
  final List<Details> details;

  BalanceWidthDetails({required this.balance, required this.details});
}
