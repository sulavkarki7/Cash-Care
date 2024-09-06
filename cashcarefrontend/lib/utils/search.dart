import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = StockController();
    return TextFormField(
      initialValue: "Stocks",
      controller: controller.searchQuery,
    );
  }
}
