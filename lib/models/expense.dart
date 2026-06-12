class Expense {
  final String name;
  final String amount;
  final String category;
  final String date;

  const Expense({
    required this.name,
    required this.amount,
    required this.category,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'amount': amount,
      'category': category,
      'date': date,
    };
  }
}
