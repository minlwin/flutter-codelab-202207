import 'package:flutter/material.dart';
import 'package:stateless/model.dart';
import 'package:stateless/user.widget.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Stateless Demo"),
      ),
      body: UserWidget(DataModel.getUser()),
    ),
  ));
}
