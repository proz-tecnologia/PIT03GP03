class Transaction {
  String? id; //Teria q ter um uuid
  double value = 0.0;
  String title = "";

  DateTime? data = DateTime.now();
  String image = "";
  String subCategoryName = "";

  Transaction({
    this.id = "",
    this.value = 0.0,
    this.title = "",
    this.data,
    this.image = "",
    this.subCategoryName = "",
  });

  Transaction copyWith({
    String? newId,
    double? newValue,
    String? newTitle,
    DateTime? newData,
    String? newImage,
    String? newSubCategory,
  }) {
    return Transaction(
      id: newId ?? this.id,
      value: newValue ?? this.value,
      title: newTitle ?? this.title,
      data: newData ?? this.data,
      image: newImage ?? this.image,
      subCategoryName: newSubCategory ?? this.subCategoryName,
    );
  }

  //Não é de Deus :(
  /*factory Transaction.fromFirestore(DocumentSnapshot doc) {
    Map map = doc.data() as Map<String, dynamic>;

    return Transaction(
      data: map["date"].toDate() as DateTime,
      title: map["title"] as String,
      value: ["value"] as double,
      image: map["image"] as String,
      subCategoryName: map["subCategory"] as String,
    );
  }*/

  Transaction.fromFirestore(Map<String, dynamic> map) {
    data = map["date"].toDate();
    title = map["title"] ?? "";
    value = map["value"] ?? 0.0;
    image = map["image"] ?? "";
    subCategoryName = map['subCategory'] ?? "";
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map["uid"] as String,
      data: map["data"].toDate() as DateTime,
      title: map["title"] as String,
      value: ["value"] as double,
      image: map["image"] as String,
      subCategoryName: map["subCategoryName"] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "value": value,
      "title": title,
      "date": data,
      "image": image,
      "subCategory": subCategoryName,
    };
  }
}

enum TransactionType { INCOME, EXPENSE }
