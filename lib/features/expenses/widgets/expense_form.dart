import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/expense.dart';
import '../../../providers/expense_provider.dart';
import 'package:intl/intl.dart';

class ExpenseForm extends ConsumerStatefulWidget {
  final Expense? expense;
  const ExpenseForm({
    super.key,
    this.expense,
  });

  @override
  ConsumerState<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends ConsumerState<ExpenseForm> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  final TextEditingController dateController = TextEditingController();

  String selectedCategory = 'Food';
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();

    dateController.text = DateFormat('dd MMM yyyy').format(selectedDate);
    if (widget.expense != null) {
      nameController.text = widget.expense!.name;
      amountController.text = widget.expense!.amount;
      selectedCategory = widget.expense!.category;
      selectedDate = DateFormat('dd MMM yyyy').parse(widget.expense!.date);
      dateController.text = widget.expense!.date;
    }
  }

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
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Category',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            'Food',
            'Travel',
            'Bills',
            'Entertainment',
            'Shopping',
          ].map((category) {
            return ChoiceChip(
              label: Text(
                category,
                style: TextStyle(
                  color: selectedCategory == category ? Colors.white : null,
                  fontWeight: FontWeight.w600,
                ),
              ),
              selected: selectedCategory == category,
              selectedColor: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              onSelected: (selected) {
                setState(() {
                  selectedCategory = category;
                });
              },
            );
          }).toList(),
        ),
        SizedBox(height: 12),
        TextField(
          controller: dateController,
          readOnly: true,
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2020),
              lastDate: DateTime(2100),
            );
            if (pickedDate != null) {
              setState(() {
                selectedDate = pickedDate;
                dateController.text =
                    DateFormat('dd MMM yyyy').format(pickedDate);
              });
            }
          },
          decoration: const InputDecoration(
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
              date: dateController.text,
            );

            if (widget.expense == null) {
              ref.read(expenseProvider.notifier).addExpense(expense);
            } else {
              ref.read(expenseProvider.notifier).editExpense(
                    widget.expense!,
                    expense,
                  );
            }

            Navigator.pop(context);
          },
          child: Text('Save Expense'),
        ),
      ],
    ));
  }
}
