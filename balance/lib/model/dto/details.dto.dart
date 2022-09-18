import 'package:balance/model/dto/balance.dto.dart';

class Details {
  int id;
  Balance? balance;
  int quentity;
  int unitPrice;

  Details({this.id = 0, this.balance, this.quentity = 1, this.unitPrice = 0});
}
