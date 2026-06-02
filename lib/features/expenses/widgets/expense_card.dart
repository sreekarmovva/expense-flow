import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  final String expenseName;
  final String amount;
  final String category;
  final String date;
  const ExpenseCard({
    super.key,
    required this.expenseName,
    required this.amount,
    required this.category,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(expenseName),
                  const SizedBox(height: 4),
                  Text(amount),
                  const SizedBox(height: 4),
                  Text(category),
                  const SizedBox(height: 4),
                  Text(date),
                ],
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Edit'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
