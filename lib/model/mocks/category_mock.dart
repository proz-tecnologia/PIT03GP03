
import 'package:flutter/foundation.dart';
import 'package:green/constants/json/meugreen.dart';
import 'package:green/model/meu_green_category.dart';



abstract class CategoryMock{
  static List< GreenList>
   getGreenList() {
     return {
       GreenList(
         categoryId: 1,
         category: 'Combustivel',
         tittle: 'fuel',
         image: 'assets/combustivel.png',
         isFavorated: false,
         isSelected: false,
         value: 0,
       ),
       GreenList(
         categoryId: 2,
         category: 'Auto',
         tittle: 'auto',
         image: 'assets/manutencao.png',
         isFavorated: false,
         isSelected: false,
         value: 0,
       ),
       GreenList(
         categoryId: 3,
         category: 'Compras',
         tittle: 'shopping',
         image: 'assets/mercado.png',
         isFavorated: false,
         isSelected: false,
         value: 0,
       ),
       GreenList(
         categoryId: 4,
         category: 'Saúde',
         tittle: 'health',
         image: 'assets/hospital.png',
         isFavorated: false,
         isSelected: false,
         value: 0,
       ),
       GreenList(
         categoryId: 5,
         category: 'Alimentação',
         tittle: 'feed',
         image: 'assets/eating.png',
         isFavorated: false,
         isSelected: false,
         value: 0,
       ),
       GreenList(
         categoryId: 6,
         category: 'Educação',
         tittle: 'education',
         image: 'assets/educacao.png',
         isFavorated: false,
         isSelected: false,
         value: 0,
       ),
       GreenList(
         categoryId: 7,
         category: 'Banco',
         tittle: 'bank',
         image: 'assets/banco.png',
         isFavorated: false,
         isSelected: false,
         value: 0,
       ),
       GreenList(
         categoryId: 8,
         category: 'Cartões',
         tittle: 'cards',
         image: 'assets/cartoes-de-credito.png',
         isFavorated: false,
         isSelected: false,
         value: 0,
       ),
       GreenList(
         categoryId: 9,
         category: 'PetShop',
         tittle: 'pet_shop',
         image: 'assets/pet-shop.png',
         isFavorated: false,
         isSelected: false,
         value: 0,
       ),
       GreenList(
         categoryId: 10,
         category: 'Academia',
         tittle: 'academy',
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
         tittle: 'others',
         image: 'assets/mais (1).png',
         isFavorated: false,
         isSelected: false,
         value: 0,
       ),
       GreenList(
         categoryId: 13,
         category: 'Farmacia',
         tittle: 'pharmacy',
         image: 'assets/farmacia.png',
         isFavorated: false,
         isSelected: false,
         value: 0,
       ),
     }.map((e) => GreenList(categoryId: 0, category: '', tittle: '', value: 0, image: '', isFavorated: false , isSelected: false)).toList();

   }

     }

