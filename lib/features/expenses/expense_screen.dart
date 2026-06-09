import 'package:flutter/material.dart';
import 'widgets/expense_card.dart';
import 'widgets/expense_form.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/expense_provider.dart';
import '../../models/expense.dart';

class ExpenseScreen extends ConsumerWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenses = ref.watch(expenseProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
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
            ...expenses.map(
              (expense) => ExpenseCard(
                expenseName: expense.name,
                amount: expense.amount,
                category: expense.category,
                date: expense.date,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
