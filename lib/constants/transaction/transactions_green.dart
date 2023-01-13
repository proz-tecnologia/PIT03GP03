// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../view/pages/drawer_pages/widgets/meu_green_subCategories.dart';

class Transaction {
  String? id;
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
      this.id = '',
      required String description,
      required this.subC});

  Transaction copyWith({
    String? id,
    double? value,
    String? title,
    String? category,
    DateTime? dateTime,
    SubCategory? subC,
  }) {
    return Transaction(
      id: id ?? this.id,
      value: value ?? this.value,
      title: title ?? this.title,
      category: category ?? this.category,
      dateTime: dateTime ?? this.dateTime,
      subC: subC ?? this.subC,
      transactionType: transactionType,
      description: "",
    );
  }

  //Não é de Deus :(
  /*Transaction.fromFirestore(Map<String, dynamic> map) {
    dateTime = map["dateTime"].toDate();
    title = map["title"] ?? "";
    value = map["value"] ?? 0.0;
    category = map["category"] ?? '';
    subC = map["subC"] ?? '';
    transactionType = map["transactionType"] ?? "";
    //description = map["description"] ?? "";


  }*/

  Map<String, dynamic> toMap() {
    return {
      "value": value,
      "title": title,
      "category": category,
      "dateTime": dateTime,
      "subC": subC,
    };
  }
}

enum TransactionType { INCOME, EXPENSE }
