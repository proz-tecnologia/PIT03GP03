// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../view/pages/drawer_pages/widgets/meu_green_subCategories.dart';
import 'package:uuid/uuid.dart';

class Transaction {
  String? id = Uuid().v4(); //Teria q ter um uuid
  double value;
  String title;
  String category;
  DateTime data;
  String image;
  String subCategoryName;

  Transaction({
    this.id,
    required this.value,
    required this.title,
    required this.category,
    required this.data,
    required this.image,
    required this.subCategoryName,
  });

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
      data: dateTime ?? this.data,
      image: image,
      subCategoryName: subCategoryName,
    );
  }

  //Não é de Deus :(
  factory Transaction.fromFirestore(DocumentSnapshot doc) {
    Map map = doc.data() as Map<String, dynamic>;

    return Transaction(
      id: map["uid"] as String,
      data: DateTime.fromMillisecondsSinceEpoch(map['data'] as int),
      title: map["title"] as String,
      value: ["value"] as double,
      category: map["category"] as String,
      image: map["image"] as String,
      subCategoryName: map["subCategoryName"] as String,
    );
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map["uid"] as String,
      data: DateTime.fromMillisecondsSinceEpoch(map['data'] as int),
      title: map["title"] as String,
      value: ["value"] as double,
      category: map["category"] as String,
      image: map["image"] as String,
      subCategoryName: map["subCategoryName"] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': id,
      "value": value,
      "title": title,
      "category": category,
      "date": data,
      "image": image,
      "subCategory": subCategoryName,
    };
  }
}

enum TransactionType { INCOME, EXPENSE }
