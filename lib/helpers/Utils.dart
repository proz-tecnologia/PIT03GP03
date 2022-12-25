import 'package:green/view/pages/drawer_pages/widgets/meu_green_subCategories.dart';

import '../models/category.dart';
import 'AppColors.dart';
import 'iconhelper.dart';

class Utils {

  static List<Category> getMockedCategories() {
    return [

Category(
    name:'Alimentação',

    color:AppColors.FOOD,
    assetsName:'fast-food',
    subCategories:[
      Subcategory(
          name: 'Fast Food ',
         color: AppColors.FOOD,
           assetsName: 'fast-food', catOption: []),



    ]
),

Category(
    name:'Transporte',

    color:AppColors.TRANSPORT,
    assetsName:'parking-car',
    subCategories:[

    ]
),
Category(
    name:'Educação',

    color:AppColors.PERSONALDEVELOPMENT,
    assetsName:'educacao',
    subCategories:[]
),
Category(
    name:'Shopping',

    color:AppColors.SHOPPING,
    assetsName:'bolsa-de-compras',
    subCategories:[]
),
Category(
    name:'Entretenimento',

    color:AppColors.ENTERTAINMENT,
    assetsName:'cinema',
    subCategories:[]
),
Category(
    name:'Casa',

    color:AppColors.HOME,
    assetsName:'home',
    subCategories:[]
),
Category(
    name:'Contas',

    color:AppColors.UTILITYBILLS,
    assetsName:'conta',
    subCategories:[]
),Category(
    name:'Saúde',

    color:AppColors.HEALTH,
    assetsName:'health',
    subCategories:[]
),Category(
    name:'Presentes ',

    color:AppColors.FOOD,
    assetsName:'gifts',
    subCategories:[]
),Category(
    name:'Kids ',

    color:AppColors.KIDS,
    assetsName:'kids',
    subCategories:[]
),




    ];
  }


}

