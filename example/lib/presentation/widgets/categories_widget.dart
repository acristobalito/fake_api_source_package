import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final List<String> categories;
  const CategoriesWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final List<Widget> categoriesWidgets =
        categories.map((e) => Chip(label: Text(e))).toList();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 10,
        children: categoriesWidgets,
      ),
    );
  }
}
