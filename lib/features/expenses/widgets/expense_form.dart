import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/expense.dart';
import '../../../providers/expense_provider.dart';

class ExpenseForm extends ConsumerStatefulWidget {
  const ExpenseForm({super.key});

  @override
  ConsumerState<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends ConsumerState<ExpenseForm> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  String selectedCategory = 'Food';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Expense Name',
          ),
        ),
        SizedBox(height: 12),
        TextField(
          controller: amountController,
          decoration: const InputDecoration(
            labelText: 'Amount',
          ),
        ),
        SizedBox(height: 12),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: 'Category',
          ),
          items: const [
            DropdownMenuItem(
              value: 'Food',
              child: Text('Food'),
            ),
            DropdownMenuItem(
              value: 'Travel',
              child: Text('Travel'),
            ),
            DropdownMenuItem(
              value: 'Bills',
              child: Text('Bills'),
            ),
            DropdownMenuItem(
              value: 'Entertainment',
              child: Text('Entertainment'),
            ),
            DropdownMenuItem(
              value: 'Shopping',
              child: Text('Shopping'),
            ),
          ],
          onChanged: (value) {
            setState(() {
              selectedCategory = value!;
            });
          },
        ),
        SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            labelText: 'Date',
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            final expense = Expense(
              name: nameController.text,
              amount: amountController.text,
              category: selectedCategory,
              date: 'Today',
            );

            ref.read(expenseProvider.notifier).addExpense(expense);

            Navigator.pop(context);
          },
          child: Text('Save Expense'),
        ),
      ],
    ));
  }
}
