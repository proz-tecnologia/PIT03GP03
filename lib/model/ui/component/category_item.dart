import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green/model/Category.dart';
import 'package:green/model/ui/component/category_detail.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  const  CategoryItem({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 //   final category =Provider.of<Category>(context);

    return Consumer<Category>(builder: (context,category,_)
    =>ClipRRect(

borderRadius: BorderRadius.circular(30),
      child: GridTile(child: GestureDetector(
        child: Image.asset(category.image,


          fit: BoxFit.contain,
   ),
        onTap:(){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryDetailPage(category: category)
          ),);
        } ,
      ),
        footer: GridTileBar(


                    backgroundColor: Colors.black38,
          leading: IconButton(
            onPressed: (){
              category.toggleFavorite();
            },
            icon:Icon(category.isFavorite ? Icons.favorite : Icons.favorite_border) ,
            color: Theme.of(context).primaryColor

          ),
          title: Text(category.name,textAlign: TextAlign.center,style: TextStyle(
            fontSize: 15,fontFamily: 'sans-serif-light'
          ),),

          trailing: IconButton(
            onPressed: () {  },
           icon: Icon((Icons.add_chart_outlined)),

          )
          ,

        ),
      ),
    ),
    );
  }
}
