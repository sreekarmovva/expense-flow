import 'package:flutter/material.dart';

class MonthlySummaryCard extends StatelessWidget {
  final String amount;

  const MonthlySummaryCard({
    super.key,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              amount,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text('Total This Month'),
          ],
        ),
      ),
    );
  }
}
