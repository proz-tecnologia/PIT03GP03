class GreenList {
  final int categoryId;
  final String category;
  final String tittle;
  final String image;
  final double value;
  bool isFavorated;
  bool isSelected;


  GreenList(
      {required this.categoryId, required this.category, required this.tittle,required this.value,
        required this.image, required this.isFavorated, required this.isSelected});



  static List<GreenList> categoryList = [
    GreenList(
        categoryId: 0,
        category: 'Meu Green',
        tittle: '+Green',
        image: 'assets/metas3.png',
        isFavorated: false,
        isSelected: false, value: 0,


    ),
    GreenList(
        categoryId: 1,
        category: 'Combustivel ',
        tittle: 'Combustivel',
        image: 'assets/combustivel.png',
        isFavorated: false,
        isSelected: false,
      value: 0,
    ),
    GreenList(
        categoryId: 2,
        category: 'Auto',
        tittle: 'Automovel',
        image: 'assets/manutencao.png',
        isFavorated: false,
        isSelected: false,
      value: 0,
    ),
    GreenList(
        categoryId: 3,
        category: 'Compras',
        tittle: 'Compras',
        image: 'assets/mercado.png',
        isFavorated: false,
        isSelected: false,
      value: 0,
    ),
    GreenList(
        categoryId: 4,
        category: 'Saúde',
        tittle: 'Saúde',
        image: 'assets/hospital.png',
        isFavorated: false,
        isSelected: false,
      value: 0,
    ),
    GreenList(
        categoryId: 5,
        category: 'Alimentação',
        tittle: 'Alimentação',
        image: 'assets/eating.png',
        isFavorated: false,
        isSelected: false,
      value: 0,
    ),
    GreenList(
        categoryId: 6,
        category: 'Educação',
        tittle: 'Educação',
        image: 'assets/educacao.png',
        isFavorated: false,
        isSelected: false,
      value: 0,
    ),
    GreenList(
        categoryId: 7,
        category: 'Banco',
        tittle: 'Banco',
        image: 'assets/banco.png',
        isFavorated: false,
        isSelected: false,
      value: 0,
    ),
    GreenList(
        categoryId: 8,
        category: 'Cartões',
        tittle: 'cartões',
        image: 'assets/cartoes-de-credito.png',
        isFavorated: false,
        isSelected: false,
      value: 0,
    ),
    GreenList(
        categoryId: 9,
        category: 'PetShop',
        tittle: 'pet-shop',
        image: 'assets/pet-shop.png',
        isFavorated: false,
        isSelected: false,
      value: 0,
    ),
    GreenList(
        categoryId: 10,
        category: 'Academia',
        tittle: 'Academia',
        image: 'assets/academia.png',
        isFavorated: false,
        isSelected: false,
      value: 0,

    ),
    GreenList(
        categoryId: 11,
        category: 'Contas',
        tittle: 'Contas',
        image: 'assets/conta.png',
        isFavorated: false,
        isSelected: false,
      value: 0,
    ),
    GreenList(
        categoryId: 12,
        category: 'Outros',
        tittle: 'Outros',
        image: 'assets/mais (1).png',
        isFavorated: false,
        isSelected: false,value: 0,

    ),
    GreenList(
        categoryId: 13,
        category: 'Farmacia',
        tittle: 'Farmacia',
        image: 'assets/farmacia.png',
        isFavorated: false,
        isSelected: false,
      value: 0,
    ),
  ];


  static List<GreenList> getFavoritedCategory() {
    List<GreenList> _travelList = GreenList.categoryList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }


  static List<GreenList> addedToCartCategory() {
    List<GreenList> _selectedCategory = GreenList.categoryList;
    return _selectedCategory.where((element) => element.isSelected == true)
        .toList();
  }


}
