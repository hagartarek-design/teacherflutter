
import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';
import 'package:flutterwallet/app/modules/home/modules/wallet.dart';

import 'file.dart';



class userInfo {

  final int? id;
  final String? email;
final String?description ;
final String?    password;
  final String ? phone;
 final String?   username;
 final String?image;
 final String?url;
 final String?type;
//  final String? gradeName;
  userInfo({
    this.id,this.url,
    this.email,
    this.description
    ,
    this.password,
    this.phone
    ,this.username
    ,this.image,
    this.type
    // this.gradeName
  });

  factory userInfo.fromJson(Map<String, dynamic> json) {
print('json'+json['id'].toString());
print('json'+json['image'].toString());
print('url'+json['url'].toString());
    return userInfo(
      
      id: json['id'] as int?,
      password: json['password'] as String?,
      url: json['url'] as String?,
    description :json ['description']as String?, 
    phone: json['phone']as String?,
    email:json['email']as String?
    ,
    image:json['image']as String ?  ??"uploads\12-1751972353057-610430779.png"
    ,// ,
    username:json['username']as String ?  ,
    type:json['type']as String?
    );
  }
}





class Images {

  final int? id;
  final String? url;

//  final String? gradeName;
  Images({
    this.id,this.url,
    
    // this.gradeName
  });

  factory Images.fromJson(Map<String, dynamic> json) {
print('jsons'+json['id'].toString());


    return Images(
      
      id: json['id'] as int?,
      
      url: json['url'] as String?,
  
    );
  }
}
