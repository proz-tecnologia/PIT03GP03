class CategoriasRepository {
  static List<dynamic> tableList = [
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

  String category = '';
  String title = '';
  double value = 0;
  late DateTime date = DateTime.now();
}
