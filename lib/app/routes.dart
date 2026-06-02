import 'package:go_router/go_router.dart';

import '../features/dashboard/dashboard_screen.dart';
import '../features/expenses/expense_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ExpenseScreen(),
    ),
  ],
);
