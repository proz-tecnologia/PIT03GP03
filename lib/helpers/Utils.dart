import 'package:green/models/category_options.dart';
import 'package:green/view/pages/drawer_pages/widgets/meu_green_subCategories.dart';

import '../models/category.dart';
import 'AppColors.dart';


class Utils {
  static List<Category> getMockedCategories() {
    return [
      Category(
          name: 'Alimentação',
          color: AppColors.FOOD,
          assetsName: 'sub6',
          subCategories: [
            Subcategory(
                name: 'Fast Food ',
                color: AppColors.FOOD,
                assetsName: 'fast-food', catOption: [
                  CategoryOption(name: 'Restaurante', assetsImg: 'sub6', isSelected: false),
              CategoryOption(name: 'Restaurante', assetsImg: 'sub6', isSelected: false),
              CategoryOption(name: 'Restaurante', assetsImg: 'sub6', isSelected: false),
              CategoryOption(name: 'Restaurante', assetsImg: 'sub6', isSelected: false),
            ],
            ),
    ]),

      Category(
          name: 'Transporte',
          color: AppColors.TRANSPORT,
          assetsName: 'maintenance',
          subCategories: [
            Subcategory(
              name: 'Transporte ',
              color: AppColors.FOOD,
              assetsName: 'Combustivel', catOption: [],
            ),
          ]),
      Category(
          name: 'Contas', color: AppColors.DARK_GREEN, assetsName: 'conta',
      subCategories: [
        Subcategory(name: 'Contas', color: AppColors.DARK_GREEN, assetsName: 'conta', catOption: [], )
      ]),
      Category(
          name: 'Shopping',
          color: AppColors.SHOPPING,
          assetsName: 'bolsa-de-compras',
          subCategories: [
            Subcategory(name: 'Contas', color: AppColors.DARK_GREEN, assetsName: 'conta', catOption: [],)
          ]


      ),
      Category(
          name: 'Entreterimento',
          color: AppColors.ENTERTAINMENT,
          assetsName: 'cinema', subCategories: []),
      Category(name: 'Saúde', color: AppColors.HEALTH, assetsName: 'health', subCategories: []),
      Category(
          name: 'Presentes',
          color: AppColors.GiftDonations,
          assetsName: 'gifts', subCategories: []),
      Category(
          name: 'kids',
          color: AppColors.KIDS,
          assetsName: 'kids',
          subCategories: []
      ),


    ];
  }
}
