// ignore_for_file: public_member_api_docs, sort_constructors_first
class Profile {
  String fullName = "";
  double limite = 0.0;

  Profile({this.fullName = "", this.limite = 0.0});

  String get firstName => fullName.split(' ').first;

  Profile.fromFirestore(Map<String, dynamic> map) {
    fullName = map["full_name"] ?? "";
    limite = map["limite"] ?? 0.0;
  }

  Map<String, dynamic> toMap() {
    return {
      "full_name": fullName,
      "limite": limite,
    };
  }

  bool get isValid => fullName.isNotEmpty;

  Profile copyWith({
    String? fullName,
    double? limite,
  }) {
    return Profile(
      fullName: fullName ?? this.fullName,
      limite: limite ?? this.limite,
    );
  }
}
