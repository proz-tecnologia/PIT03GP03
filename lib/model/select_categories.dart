class SelectedCategories{
  String tittle;
  String image;

//<editor-fold desc="Data Methods">

  SelectedCategories({
    required this.tittle,
    required this.image,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SelectedCategories &&
          runtimeType == other.runtimeType &&
          tittle == other.tittle &&
          image == other.image);

  @override
  int get hashCode => tittle.hashCode ^ image.hashCode;

  @override
  String toString() {
    return 'SelectedCategories{' +
        ' tittle: $tittle,' +
        ' image: $image,' +
        '}';
  }

  SelectedCategories copyWith({
    String? tittle,
    String? image,
  }) {
    return SelectedCategories(
      tittle: tittle ?? this.tittle,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tittle': this.tittle,
      'image': this.image,
    };
  }

  factory SelectedCategories.fromMap(Map<String, dynamic> map) {
    return SelectedCategories(
      tittle: map['tittle'] as String,
      image: map['image'] as String,
    );
  }

//</editor-fold>
}