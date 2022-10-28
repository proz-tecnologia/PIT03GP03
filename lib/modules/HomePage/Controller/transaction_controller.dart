import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TransActionController {
  final List<String> categoryList = [
    'Viagem',
    'Alimentação',
    'Roupa',
    'Transporte'
  ];

  IconData icon(String category) {
    if (category == 'Alimentação') {
      return Icons.food_bank;
    } else if (category == 'Viagem') {
      return Iconsax.airplane;
    } else if (category == 'Roupa') {
      return Iconsax.shop;
    } else {
      return Iconsax.car;
    }
  }

  String category = 'Alimentação';

  String title = '';

  double value = 0;
}
