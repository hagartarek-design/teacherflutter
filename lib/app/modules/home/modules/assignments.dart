
import 'file.dart';



class Assignments {
  final int? id;
  final String? name;
final int?degree;
final String?lastdate;
final String?startdate;
final int?price;
final String?assigncardimg;
  Assignments({
    this.id,
    this.name,
    this.degree,
    this.lastdate,
    this.startdate
    // ,this.sheets_paym
    ,this.price
    ,this.assigncardimg,
 });

  factory Assignments.fromJson(Map<String, dynamic> json) {
print('json'+json['id'].toString());
    return Assignments(
      
      id: json['id'] as int?,
      name: json['name'] as String?,
    degree :json ['degree']as int?, 
    lastdate: json['lastdate']as String?,
    startdate:json['startdate']as String?
    // ,sheets_paym:['sheets_paym']as bool ?  
    ,price:json['price']as int?
    ,assigncardimg:json['assigncardimg']as String?
       )
    ;
  }
  
}
