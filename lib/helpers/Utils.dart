import 'package:green/models/category_options.dart';
import 'package:green/view/pages/drawer_pages/widgets/meu_green_subCategories.dart';

import '../models/category.dart';
import 'AppColors.dart';
import 'iconhelper.dart';

class Utils {

  static List<Category> getMockedCategories() {
    return [

Category(
    name:'Alimentação',
categoryId:0,
    color:AppColors.FOOD,
    assetsName:'fast-food',
    subCategories:[
      Subcategory(
          name: 'Restaurante  ',
         color: AppColors.FOOD,
           assetsName: 'sub6',
        catOption: [



      ], catID: 300,
)
    ]
    ),





    Category(
    name:'Transporte',
    categoryId:1,
    color:AppColors.TRANSPORT,
    assetsName:'carro',
    subCategories:[
    Subcategory(
    name: 'Transportes ',
    color: AppColors.TRANSPORT,
    assetsName: 'transporte', catOption: [], catID: 301,

    )
    ]
    ),




];
  }


}

