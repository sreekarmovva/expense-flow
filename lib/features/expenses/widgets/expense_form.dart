import 'package:flutter/material.dart';

class ExpenseForm extends StatelessWidget {
  const ExpenseForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Expense Name',
          ),
        ),
        SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
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
          onChanged: (value) {},
        ),
        SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            labelText: 'Date',
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: Text('Save Expense'),
        ),
      ],
    ));
  }
}
