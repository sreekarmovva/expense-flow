import 'package:flutter/material.dart';

class TransactionRow extends StatelessWidget {
  final String transactionName;
  final String amount;

  const TransactionRow({
    super.key,
    required this.transactionName,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(transactionName),
          Text(amount),
        ],
      ),
    );
  }
}
