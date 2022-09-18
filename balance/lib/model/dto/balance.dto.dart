import 'package:balance/model/dto/category.dto.dart';

class Balance {
  int id;
  int createAt;
  Category? category;
  String remark;

  Balance({this.id = 0, this.createAt = 0, this.category, this.remark = ""});
}
