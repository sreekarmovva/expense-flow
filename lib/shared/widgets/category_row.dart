import 'package:flutter/material.dart';

class CategoryRow extends StatelessWidget {
  final String categoryName;
  final String amount;

  const CategoryRow({
    super.key,
    required this.categoryName,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(categoryName),
          Text(amount),
        ],
      ),
    );
  }
}
