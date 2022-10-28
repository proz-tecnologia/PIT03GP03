class TransactionModel{
  TransactionModel({required this.title,required this.dateTime,required this.logo2,
    required this.name,
    required this.amount});


  TransactionModel.fromJson(Map<String,dynamic>json, this.logo2, this.name,  this.amount)
      :title =json['title'],
        dateTime=DateTime.parse(json['dateTime']);
  String title;
  DateTime dateTime;
  final String logo2;
  final String name;
  final String amount;

  Map<String, dynamic>toJson(){
    return{
      'title':title,
      'dateTime':dateTime.toIso8601String(),

    };
  }

}
