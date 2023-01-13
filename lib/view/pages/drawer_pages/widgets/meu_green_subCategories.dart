class SubCategory {
  String name;
  String assetsName;
  bool isSelected;

  SubCategory(
      {required this.name, required this.assetsName, required this.isSelected});

  SubCategory copyWith({
    String? name,
    String? assetsName,
    bool? isSelected,
  }) {
    return SubCategory(
      name: name ?? this.name,
      assetsName: assetsName ?? this.assetsName,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'assetsName': assetsName,
      'isSelected': isSelected,
    };
  }
}
