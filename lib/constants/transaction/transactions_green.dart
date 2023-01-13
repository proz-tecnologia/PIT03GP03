import '../../view/pages/drawer_pages/widgets/meu_green_subCategories.dart';

class Transaction {
  int Id;
  double value;
  String title;
  String? category;
  DateTime dateTime;
  TransactionType transactionType;
  SubCategory subC;

  Transaction(
      {this.transactionType = TransactionType.INCOME,
        this.value = 0.0,
        this.title = '',
        this.category,
        required this.dateTime,
        this.Id = 0,
        required String description,
        required this.subC});
}

enum TransactionType { INCOME, EXPENSE }
