class Transaction {
  final double value;
  final String title;
  final String category;
  final DateTime date = DateTime.now();

  Transaction({
    required this.value,
    required this.title,
    required this.category,
    required DateTime dateTime,
  });
}
