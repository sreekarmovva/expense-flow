import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../models/expense.dart';

class ExpenseNotifier extends Notifier<List<Expense>> {
  @override
  List<Expense> build() {
    final box = Hive.box('expenses');

    return box.values
        .map(
          (item) => Expense.fromMap(
            Map<String, dynamic>.from(item),
          ),
        )
        .toList();
  }

  void addExpense(Expense expense) {
    final box = Hive.box('expenses');
    box.add(expense.toMap());
    state = [...state, expense];
  }

  void deleteExpense(Expense expense) {
    final box = Hive.box('expenses');
    final index = state.indexOf(expense);
    final key = box.keyAt(index);
    box.delete(key);
    state = state.where((item) => item != expense).toList();
  }

  void editExpense(
    Expense oldExpense,
    Expense updatedExpense,
  ) {
    final box = Hive.box('expenses');
    final index = state.indexOf(oldExpense);
    final key = box.keyAt(index);
    box.put(key, updatedExpense.toMap());
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
