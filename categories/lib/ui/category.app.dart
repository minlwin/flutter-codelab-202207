import 'package:categories/ui/views/category.list.dart';
import 'package:flutter/material.dart';

class CategoryApp extends StatelessWidget {
  const CategoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryListView(),
    );
  }
}
