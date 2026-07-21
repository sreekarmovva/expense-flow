import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/logos/pennypilot_logo.png',
                width: 90,
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'PennyPilot',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Every Penny Has a Direction.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 171, 170, 170),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Card(
              child: ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text('View Dashboard'),
                subtitle: const Text('See summaries and insights'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  context.go('/dashboard');
                },
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: const Icon(Icons.account_balance_wallet),
                title: const Text('Manage Expenses'),
                subtitle: const Text('Add, edit and delete expenses'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  context.go('/expenses');
                },
              ),
            ),
            const Spacer(),
            const Divider(),
            const Text(
              '🛠 Upcoming Features',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text('• Monthly Analytics'),
            const Text('• Settings & Personalization'),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Version 1.0',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
