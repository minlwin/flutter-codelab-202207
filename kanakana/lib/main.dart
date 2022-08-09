import 'package:flutter/material.dart';
import 'package:kanakana/application.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: KanaApplication(),
    ),
  ));
}
