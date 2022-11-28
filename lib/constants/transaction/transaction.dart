class Transaction {
  final double value;
  final String title;
  final String category;
  final DateTime date = DateTime.now();
  final date1 = DateTime.now().subtract(Duration(days: 31));
  final fromDate = DateTime(19, 11, 2022);
  final toDate = DateTime.now();

  Transaction({
    required this.value,
    required this.title,
    required this.category,
    required DateTime dateTime,
  });
}
