import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../Category.dart';
import '../../provider/category_list.dart';
import 'category_item.dart';

class CategoryGrid extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final  provider =Provider.of<CategoryList>(context);
    final List<Category>loadedCategory=provider.items;
    return GridView.builder(
      itemCount:loadedCategory.length,
      itemBuilder: (context,i)=>ChangeNotifierProvider.value(value: loadedCategory[i],
        child:CategoryItem(),
      ),
      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10

      ) ,
    );
  }
}
