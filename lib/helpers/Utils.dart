import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:green/models/bar_char.models.dart';
import 'package:green/view/pages/drawer_pages/widgets/meu_green_subCategories.dart';
import '../models/category.dart';
import 'AppColors.dart';

class Utils {
  static List<Category> getMockedCategories() {
    return [
      Category(
        categoryId: 0,
        name: 'Refeições',
        color: AppColors.FOOD,
        assetsName: 'sub6',
        subCategory: [
          SubCategory(
            name: 'Restaurante',
            assetsName: 'hamburger',
            isSelected: false,
          ),
          SubCategory(
            name: 'Frutas',
            assetsName: 'comidas2',
            isSelected: false,
          ),
          SubCategory(
            name: 'Bebidas',
            assetsName: 'sub5',
            isSelected: false,
          ),
          SubCategory(
            name: 'Mercado',
            assetsName: 'sub7',
            isSelected: false,
          ),
        ],
        isFavorited: false,
      ),
      Category(
        categoryId: 1,
        name: 'Transporte',
        color: AppColors.TRANSPORT,
        assetsName: 'carro',
        subCategory: [
          SubCategory(
            name: 'Combustivel',
            assetsName: 'sub4',
            isSelected: false,
          ),
          SubCategory(
            name: 'Serviços e Manunteções',
            assetsName: 'sub2',
            isSelected: false,
          ),
          SubCategory(
            name: 'APP',
            assetsName: 'carro',
            isSelected: false,
          ),
          SubCategory(
            name: 'App',
            assetsName: 'sub340',
            isSelected: false,
          ),
          SubCategory(
            name: 'Estacionamento',
            assetsName: 'car',
            isSelected: false,
          ),
        ],
        isFavorited: false,
      ),
      Category(
        categoryId: 2,
        name: 'Contas',
        color: AppColors.DARK_GREEN,
        assetsName: 'conta',
        subCategory: [
          SubCategory(
              name: 'Energia Eletrica', assetsName: 'sub28', isSelected: false),
          SubCategory(
            name: 'Agua',
            assetsName: 'sub25',
            isSelected: false,
          ),
          SubCategory(
            name: 'Internet',
            assetsName: 'sub27',
            isSelected: false,
          ),
          SubCategory(
            name: 'Celular',
            assetsName: 'sub26',
            isSelected: false,
          ),
          SubCategory(
            name: 'Aluguel',
            assetsName: 'banco',
            isSelected: false,
          ),
          SubCategory(
            name: 'Aluguel',
            assetsName: 'cartoes-de-credito',
            isSelected: false,
          ),
          SubCategory(
            name: 'Aluguel',
            assetsName: 'sub29',
            isSelected: false,
          ),
        ],
        isFavorited: false,
      ),
      Category(
        categoryId: 3,
        name: 'Casa',
        color: AppColors.HOME,
        assetsName: 'home',
        subCategory: [
          SubCategory(
            name: 'Animais',
            assetsName: 'sub18',
            isSelected: false,
          ),
          SubCategory(
            name: 'Móveis',
            assetsName: 'sub30',
            isSelected: false,
          ),
          SubCategory(
            name: 'Dispositivos Eletronicos',
            assetsName: 'sub14',
            isSelected: false,
          ),
        ],
        isFavorited: false,
      ),
      Category(
        categoryId: 4,
        name: 'Shopping',
        color: AppColors.SHOPPING,
        assetsName: 'sub16',
        subCategory: [
          SubCategory(
            name: 'Roupas',
            assetsName: 'sub16',
            isSelected: false,
          ),
          SubCategory(
            name: 'Acessórios',
            assetsName: 'sub15',
            isSelected: false,
          ),
          SubCategory(
            name: 'Dispositivos Eletronicos',
            assetsName: 'sub14',
            isSelected: false,
          ),
        ],
        isFavorited: false,
      ),
      Category(
        categoryId: 5,
        name: 'Streaming',
        color: AppColors.ENTERTAINMENT,
        assetsName: 'sub34',
        subCategory: [
          SubCategory(
            name: 'Netflix',
            assetsName: 'sub34',
            isSelected: false,
          ),
          SubCategory(
            name: 'Jogos',
            assetsName: 'sub32',
            isSelected: false,
          ),
          SubCategory(
            name: 'Jogos',
            assetsName: 'playstore',
            isSelected: false,
          ),
          SubCategory(
            name: "Spotify",
            assetsName: 'sub33',
            isSelected: false,
          ),
        ],
        isFavorited: false,
      ),
      Category(
        categoryId: 6,
        name: 'Saúde',
        color: AppColors.HEALTH,
        assetsName: 'sub123',
        subCategory: [
          SubCategory(
            name: 'Hospital',
            assetsName: 'sub23',
            isSelected: false,
          ),
          SubCategory(
            name: 'Medico',
            assetsName: 'sub24',
            isSelected: false,
          ),
          SubCategory(
            name: 'Farmacia ',
            assetsName: 'farmacia',
            isSelected: false,
          ),
          SubCategory(
            name: 'Farmacia ',
            assetsName: 'mental',
            isSelected: false,
          ),
        ],
        isFavorited: false,
      ),
      Category(
        categoryId: 7,
        name: 'kids',
        color: AppColors.KIDS,
        assetsName: 'sub21',
        subCategory: [
          SubCategory(
            name: 'Mesada',
            assetsName: 'sub22',
            isSelected: false,
          ),
          SubCategory(
            name: 'Gastos',
            assetsName: 'sub21',
            isSelected: false,
          ),
          SubCategory(
            name: 'Babá',
            assetsName: 'sub20',
            isSelected: false,
          ),
          SubCategory(
            name: 'Educação',
            assetsName: 'educacao',
            isSelected: false,
          ),
        ],
        isFavorited: false,
      ),
    ];
  }

  static List<BarCharModel> getMockedChart() {
    return <BarCharModel>[
      BarCharModel(
        categoria: 'Refeições',
        total: 0.0,
        color: charts.ColorUtil.fromDartColor(AppColors.FOOD),
      ),
      BarCharModel(
        categoria: 'Transporte',
        total: 0.0,
        color: charts.ColorUtil.fromDartColor(AppColors.TRANSPORT),
      ),
      BarCharModel(
        categoria: 'Contas',
        total: 0.0,
        color: charts.ColorUtil.fromDartColor(AppColors.DARK_GREEN),
      ),
      BarCharModel(
        categoria: 'Casa',
        total: 0.0,
        color: charts.ColorUtil.fromDartColor(AppColors.HOME),
      ),
      BarCharModel(
        categoria: 'Shopping',
        total: 0.0,
        color: charts.ColorUtil.fromDartColor(AppColors.SHOPPING),
      ),
      BarCharModel(
        categoria: 'Streaming',
        total: 0.0,
        color: charts.ColorUtil.fromDartColor(AppColors.ENTERTAINMENT),
      ),
      BarCharModel(
        categoria: 'Saúde',
        total: 0.0,
        color: charts.ColorUtil.fromDartColor(AppColors.HEALTH),
      ),
      BarCharModel(
        categoria: 'kids',
        total: 0.0,
        color: charts.ColorUtil.fromDartColor(AppColors.KIDS),
      ),
    ];
  }
}
