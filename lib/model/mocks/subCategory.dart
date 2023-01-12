import 'package:green/view/pages/drawer_pages/widgets/meu_green_subCategories.dart';

import '../../models/category.dart';

class subCategory{

  final String name;
final   String  assetsName;
   bool  isSelected;


subCategory({
    required this.name,required this.assetsName,required this.isSelected});



}

List<subCategory>sub=
    [
    subCategory(
    name: 'Restaurante',
    assetsName: 'fast-food',
    isSelected: false),


    subCategory(
    name: 'Bebidas',
    assetsName: 'sub5',
    isSelected: false),

      subCategory(
    name: 'Mercado',
    assetsName: 'sub7',
    isSelected: false),




      subCategory(name: 'Combustivel',
    assetsName: 'sub4',
    isSelected: false),
      subCategory(name: 'Estacionamento',
    assetsName: 'parking-car',
    isSelected: false),
      subCategory(name: 'Serviços e Manunteções',
    assetsName: 'sub2',
    isSelected: false),
      subCategory(name: ' Recarga de Cartão',
    assetsName: 'sub1',
    isSelected: false),






      subCategory(name: 'Energia Eletrica',
    assetsName: 'sub28',
    isSelected: false)
    ,subCategory(name: 'Agua',
    assetsName: 'sub25',
    isSelected: false, )
    ,subCategory(name: 'Internet',
    assetsName: 'sub27',
    isSelected: false)
    ,subCategory(name: 'Celular',
    assetsName: 'sub26',
    isSelected: false),
      subCategory(name: 'Aluguel',
    assetsName: 'sub29',
    isSelected: false),

      subCategory(name: 'Animais',
    assetsName: 'sub18',
    isSelected: false),
      subCategory(name: 'Móveis',
    assetsName: 'sub30',
    isSelected: false),
      subCategory(name: 'Dispositivos Eletronicos',
    assetsName: 'sub14',
    isSelected: false),


      subCategory(name: 'Roupas',
    assetsName: 'sub16',
    isSelected: false),
      subCategory(name: 'Acessórios',
    assetsName: 'sub15',
    isSelected: false),
      subCategory(name: 'Dispositivos Eletronicos',
    assetsName: 'sub14',
    isSelected: false),

  ];