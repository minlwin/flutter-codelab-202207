import 'package:balance/model/dto/balance.dto.dart';

class Details {
  int id;
  Balance? balance;
  String item;
  int amount;

  Details({this.id = 0, this.balance, this.item = "", this.amount = 0});

  factory Details.from(Map<String, dynamic> map) => Details(
      id: map['id'],
      balance: containsBalance(map) ? Balance.from(map) : null,
      item: map['item'],
      amount: map['amount']);

  Map<String, dynamic> toMap() => {
        "balance_id": balance!.id,
        "item": item,
        "amount": amount,
      };
  static List<Details> list(List<Map<String, dynamic>> result) =>
      List.from(result.map((e) => Details.from(e)));
}

bool containsBalance(Map<String, dynamic> map) =>
    map.containsKey("balance_id") && map.containsKey("category_id");
