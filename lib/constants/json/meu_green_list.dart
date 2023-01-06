 abstract class GreenList {
   int ?categoryId;
   String ?category;
   String ?tittle;
   String ?image;
   double ?value;
   String ?date;
   String ?time;
  bool ?isFavorated;
  bool ?isSelected;

  GreenList(
      { this.categoryId,
         this.category,
         this.tittle,
         this.value,
        this.date,
        this.time,
         this.image,
         this.isFavorated,
         this.isSelected});

  Map<String,dynamic>toMap(){
    Map<String,dynamic>map={
      'categoryId':categoryId,
      'category':category,
      'tittle':tittle,
      'image':image,
      'value':value,
      'date':date,
      'time':time,
      'isFavorated':isFavorated,
      'isSelect':isSelected
    };
    if (categoryId!=null){
      map['categoryId']=categoryId;
    }
    return map;
  }

  }

