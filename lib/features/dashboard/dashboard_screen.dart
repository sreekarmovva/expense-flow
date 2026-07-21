import 'package:flutter/material.dart';
import 'widgets/monthly_summary_card.dart';
import '../../shared/widgets/category_row.dart';
import '../../shared/widgets/section_title.dart';
import '../../shared/widgets/transaction_row.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/expense_provider.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenses = ref.watch(expenseProvider);
    double total = 0;

    Map<String, double> categoryTotals = {};

    for (final expense in expenses) {
      if (categoryTotals.containsKey(expense.category)) {
        categoryTotals[expense.category] =
            categoryTotals[expense.category]! + double.parse(expense.amount);
      } else {
        categoryTotals[expense.category] = double.parse(expense.amount);
      }
    }
    final sortedCategories = categoryTotals.entries.toList();

    sortedCategories.sort((a, b) {
      return b.value.compareTo(a.value);
    });

    for (final expense in expenses) {
      total += double.parse(expense.amount);
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home_outlined),
          onPressed: () {
            context.go('/');
          },
        ),
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MonthlySummaryCard(
              amount: '₹${total.toString()}',
            ),
            SizedBox(height: 24),
            SectionTitle(
              title: 'Top Categories',
            ),
            ...sortedCategories.take(3).map((entry) {
              return CategoryRow(
                categoryName: entry.key,
                amount: '₹${entry.value}',
              );
            }),
            SizedBox(height: 24),
            SectionTitle(
              title: 'Recent Transactions',
            ),
            ...expenses.map((expense) {
              return TransactionRow(
                transactionName: expense.name,
                amount: '₹${expense.amount}',
              );
            }),
          ],
        ),
      ),
    );
  }
}
