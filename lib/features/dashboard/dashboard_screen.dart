import 'package:flutter/material.dart';
import 'widgets/monthly_summary_card.dart';
import '../../shared/widgets/category_row.dart';
import '../../shared/widgets/section_title.dart';
import '../../shared/widgets/transaction_row.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/expense_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenses = ref.watch(expenseProvider);
    double total = 0;

    for (final expense in expenses) {
      total += double.parse(expense.amount);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpenseFlow'),
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
            CategoryRow(
              categoryName: 'Food',
              amount: '₹3000',
            ),
            CategoryRow(
              categoryName: 'Travel',
              amount: '₹2500',
            ),
            CategoryRow(
              categoryName: 'Bills',
              amount: '₹2000',
            ),
            SizedBox(height: 24),
            SectionTitle(
              title: 'Recent Transactions',
            ),
            TransactionRow(
              transactionName: 'Netflix',
              amount: '₹199',
            ),
            TransactionRow(
              transactionName: 'Lunch',
              amount: '₹250',
            ),
            TransactionRow(
              transactionName: 'Uber',
              amount: '₹180',
            ),
          ],
        ),
      ),
    );
  }
}
