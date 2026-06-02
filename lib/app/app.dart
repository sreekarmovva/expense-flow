import 'package:flutter/material.dart';

import 'routes.dart';
import 'themes.dart';

class ExpenseFlowApp extends StatelessWidget {
  const ExpenseFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'ExpenseFlow',
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: appRouter,
    );
  }
}
