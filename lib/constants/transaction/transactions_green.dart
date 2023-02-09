// ignore_for_file: public_member_api_docs, sort_constructors_first
class Transaction {
  String? id; //Teria q ter um uuid
  double value = 0.0;
  String title = "";
  String categorie = "";
  DateTime? data = DateTime.now();
  String image = "";
  String subCategoryName = "";

  Transaction({
    this.id = "",
    this.value = 0.0,
    this.title = "",
    this.categorie = "",
    this.data,
    this.image = "",
    this.subCategoryName = "",
  });

  Transaction copyWith({
    String? newId,
    double? newValue,
    String? newTitle,
    DateTime? newData,
    String? newCategorie,
    String? newImage,
    String? newSubCategory,
  }) {
    return Transaction(
      id: newId ?? this.id,
      value: newValue ?? this.value,
      title: newTitle ?? this.title,
      data: newData ?? this.data,
      categorie: newCategorie ?? this.categorie,
      image: newImage ?? this.image,
      subCategoryName: newSubCategory ?? this.subCategoryName,
    );
  }

  Transaction.fromFirestore(Map<String, dynamic> map) {
    data = map["date"].toDate();
    title = map["title"] ?? "";
    value = map["value"] ?? 0.0;
    categorie = map["categorie"] ?? "";
    image = map["image"] ?? "";
    subCategoryName = map['subCategory'] ?? "";
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map["uid"] as String,
      data: map["data"].toDate() as DateTime,
      title: map["title"] as String,
      value: map["value"] as double,
      categorie: map["categorie"] as String,
      image: map["image"] as String,
      subCategoryName: map["subCategoryName"] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "value": value,
      "title": title,
      "date": data,
      "categorie": categorie,
      "image": image,
      "subCategory": subCategoryName,
    };
  }
}

enum TransactionType { INCOME, EXPENSE }
