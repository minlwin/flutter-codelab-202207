import 'package:flutter/material.dart';

class Category {
  int id;
  String name;
  Color? color;
  bool credit;

  Category({this.id = 0, this.name = "", this.color, this.credit = true});
}
