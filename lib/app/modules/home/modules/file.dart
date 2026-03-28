



class Event {
  final int? id;
  final String? title;
final String?description ;

 
final String?    createdate;
    
  final String ? updateddate;
    
 final Map?   course;
 final String?eventDate;
 final String?type;
//  final String? gradeName;
  Event({
    this.id,
    this.title,
    this.description
    ,
    this.createdate,
    this.updateddate
    ,this.course
    ,this.eventDate,
    this.type
    // this.gradeName
  });

  factory Event.fromJson(Map<String, dynamic> json) {
// print('json'+json['id'].toString());
    return Event(
      
      id: json['id'] as int?,
      title: json['title'] as String?,
    description :json ['description']as String?, 
    createdate: json['createdate']as String?,
    updateddate:json['updateddate']as String?
    ,
    course:json['course']as Map ?  
    ,// ,
    eventDate:json['eventDate']as String ?  ,
    type:json['type']as String?
    );
  }
}
