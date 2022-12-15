class GreenList {
  final int categoryId;
  final String category;
  final String tittle;
  final String image;
  bool isFavorated;

  bool isSelected;


  GreenList(
      {required this.categoryId, required this.category, required this.tittle,
        required this.image, required this.isFavorated, required this.isSelected});



  static List<GreenList> categoryList = [
    GreenList(
        categoryId: 0,
        category: 'Meu Green',
        tittle: '+Green',
        image: 'assets/metas3.png',
        isFavorated: false,
        isSelected: false
    ),
    GreenList(
        categoryId: 1,
        category: 'Combustivel ',
        tittle: 'Combustivel',
        image: 'assets/combustivel.png',
        isFavorated: false,
        isSelected: false
    ),
    GreenList(
        categoryId: 2,
        category: 'Auto',
        tittle: 'Automovel',
        image: 'assets/Transportation.png',
        isFavorated: false,
        isSelected: false
    ),
    GreenList(
        categoryId: 3,
        category: 'Compras',
        tittle: 'Compras',
        image: 'assets/mercado.png',
        isFavorated: false,
        isSelected: false
    ),
    GreenList(
        categoryId: 4,
        category: 'Saúde',
        tittle: 'Saúde',
        image: 'assets/hospital.png',
        isFavorated: false,
        isSelected: false
    ),
    GreenList(
        categoryId: 5,
        category: 'Alimentação',
        tittle: 'Alimentação',
        image: 'assets/eating.png',
        isFavorated: false,
        isSelected: false
    ),
    GreenList(
        categoryId: 6,
        category: 'Educação',
        tittle: 'Educação',
        image: 'assets/Education.png',
        isFavorated: false,
        isSelected: false
    ),
    GreenList(
        categoryId: 7,
        category: 'Banco',
        tittle: 'Banco',
        image: 'assets/bank.png',
        isFavorated: false,
        isSelected: false
    ),
    GreenList(
        categoryId: 8,
        category: 'Cartões',
        tittle: 'cartões',
        image: 'assets/Transfer.png',
        isFavorated: false,
        isSelected: false
    ),
    GreenList(
        categoryId: 9,
        category: 'PetShop',
        tittle: 'petshop',
        image: 'assets/petshop.png',
        isFavorated: false,
        isSelected: false
    ),
    GreenList(
        categoryId: 10,
        category: 'Academia',
        tittle: 'Academia',
        image: 'assets/auto.png',
        isFavorated: false,
        isSelected: false
    ),
    GreenList(
        categoryId: 11,
        category: 'Auto',
        tittle: 'Automovel',
        image: 'assets/auto.png',
        isFavorated: false,
        isSelected: false
    ),
    GreenList(
        categoryId: 12,
        category: 'Outros',
        tittle: 'Automovel',
        image: 'assets/auto.png',
        isFavorated: false,
        isSelected: false
    ),
    GreenList(
        categoryId: 13,
        category: 'Auto',
        tittle: 'Automovel',
        image: 'assets/auto.png',
        isFavorated: false,
        isSelected: false
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
