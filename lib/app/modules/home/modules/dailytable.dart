
import 'package:flutterwallet/app/modules/home/modules/wallet.dart';

import 'file.dart';



class Dailytable {
  final int? id;
final List?course_info;
//  final String? gradeName;
  Dailytable({
    this.id,
this.course_info
  });

  factory Dailytable.fromJson(Map<String, dynamic> json) {
  print('json'+json['id'].toString());
    return Dailytable(
      
      id: json['id'] as int?,
      course_info:json['course_info'] as List?,
    
    );

  }
}
