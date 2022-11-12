const List categories = [
  {"name": "+ Green", "icon": "assets/metas2.png"},
  {"name": "Auto", "icon": "assets/auto.png"},
  {"name": "Compras", "icon": "assets/mercado.png"},
  {"name": "Saúde", "icon": "assets/hospital.png"},
  {"name": "Alimentação", "icon": "assets/eating.png"},
  {"name": "Educação", "icon": "assets/Education.png"},
  {"name": "Banco", "icon": "assets/bank.png"},
  {"name": "Cartões", "icon": "assets/Transfer.png"},
  {"name": "PetShop", "icon": "assets/petshop.png"},
  {"name": "Academia", "icon": "assets/academia2.png"},
];

class Date {
  Date({required this.title, required this.dateTime});

  Date.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        dateTime = DateTime.parse(json['dateTime']);
  String title;
  DateTime dateTime;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'dateTime': dateTime.toIso8601String(),
    };
  }
}
