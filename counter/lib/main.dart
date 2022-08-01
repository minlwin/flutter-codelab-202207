import 'package:counter/counter.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Counter(),
    ),
  ));
}
