class Transaction {
  int Id;
  double value;
  String title;
  String? category;
  DateTime dateTime;
  TransactionType transactionType;


  Transaction({
    this.transactionType = TransactionType.INCOME,
    this.value = 0.0,
    this.title = '',
    this.category,
    required this.dateTime,
    this.Id=0, required String description
  });
}

enum TransactionType { INCOME, EXPENSE }
