import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/expense.dart';

class ExpenseNotifier extends Notifier<List<Expense>> {
  @override
  List<Expense> build() {
    return [
      const Expense(
        name: 'Netflix',
        amount: '₹199',
        category: 'Entertainment',
        date: '01 Jun 2026',
      ),
      const Expense(
        name: 'Lunch',
        amount: '₹250',
        category: 'Food',
        date: '02 Jun 2026',
      ),
      const Expense(
        name: 'Coffee',
        amount: '₹500',
        category: 'Food',
        date: '03 Jun 2026',
      ),
    ];
  }

  void addExpense(Expense expense) {
    state = [...state, expense];
  }

  void deleteExpense(Expense expense) {
    state = state.where((item) => item != expense).toList();
  }

  void editExpense(
    Expense oldExpense,
    Expense updatedExpense,
  ) {
    state = state.map((expense) {
      if (expense == oldExpense) {
        return updatedExpense;
      }
      return expense;
    }).toList();
  }
}

final expenseProvider = NotifierProvider<ExpenseNotifier, List<Expense>>(
  ExpenseNotifier.new,
);
