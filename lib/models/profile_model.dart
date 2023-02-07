import 'package:intl/intl.dart';

class Profile {
  String fullName = "";
  double limite = 0.0;
  int diaFechamento = 0;
  String faturaAtual = "";

  Profile(
      {this.fullName = "",
      this.limite = 0.0,
      this.diaFechamento = 0,
      this.faturaAtual = ""});

  String get firstName => fullName.split(' ').first;

  //apagar na novo formato
  Profile novaFatura(Profile p) {
    DateTime data = DateTime.now();

    String newFatura = DateFormat("MMMM_YYYY", "pt_BR").format(data).toString();

    return p.copyWith(newFatura: newFatura);
  }

  Profile.fromFirestore(Map<String, dynamic> map) {
    fullName = map["full_name"] ?? "";
    limite = map["limite"] ?? 0.0;
    diaFechamento = map['fechamento'] ?? 0;
    faturaAtual = map["fatura_atual"] ?? "";
  }

  Map<String, dynamic> toMap() {
    return {
      "full_name": fullName,
      "limite": limite,
      'fechamento': diaFechamento,
      "fatura_atual": faturaAtual,
    };
  }

  bool get isValid => fullName.isNotEmpty;

  Profile copyWith({
    String? fullName,
    double? limite,
    int? newDia,
    String? newFatura,
  }) {
    return Profile(
      fullName: fullName ?? this.fullName,
      limite: limite ?? this.limite,
      diaFechamento: newDia ?? this.diaFechamento,
      faturaAtual: newFatura ?? this.faturaAtual,
    );
  }
}
