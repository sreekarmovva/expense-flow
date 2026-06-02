import 'package:flutter/material.dart';
import 'widgets/expense_card.dart';
import 'widgets/expense_form.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Add Expense'),
                      content: const ExpenseForm(),
                    );
                  },
                );
              },
              child: const Text('+ Add Expense'),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'History',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const ExpenseCard(
              expenseName: 'Netflix',
              amount: '₹199',
              category: 'Entertainment',
              date: '01 Jun 2026',
            ),
            const ExpenseCard(
              expenseName: 'Lunch',
              amount: '₹250',
              category: 'Food',
              date: '02 Jun 2026',
            ),
            const ExpenseCard(
              expenseName: 'Uber',
              amount: '₹180',
              category: 'Travel',
              date: '03 Jun 2026',
            ),
          ],
        ),
      ),
    );
  }
}
