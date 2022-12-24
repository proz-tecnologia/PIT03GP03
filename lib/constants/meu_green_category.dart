class CategoryItem{
   int ?  categoryId;
   String ? category;
   String ? tittle;
   String ? image;
   String ?description;

   CategoryItem(this.categoryId, this.category, this.tittle, this.image,this .description);


   factory CategoryItem.fromJson(Map<String ,dynamic>json){
      return new CategoryItem(json['categoryId'],json['category'],json['tittle'],json['image'],json['description']);
   }
   Map<String,dynamic>toJson(){
      return{
         'categoryId' : this.categoryId,
         'category':this.category,
         'tittle':this.tittle,
         'image':this.image,
         'description':this.description
      };
   }
}