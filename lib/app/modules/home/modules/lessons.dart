



class Lessons {
  final int? id;
  final String? name;
final int?course_num; 
//  final String ?type;
final String?question_name;
final List<dynamic>?questions;
//  final String? gradeName;
  Lessons({
    this.id,
    this.name
,this.course_num,
  //  , this.type,
   this.question_name
    ,this.questions
  });

  factory Lessons.fromJson(Map<String, dynamic> json) {
// print('json'+json['questions'].toString());
print('jsonsss'+json['questions'].toString());
    return Lessons(
      
      id: json['id'] as int? ??0,
      name: json['name'] as String? ??'',
      course_num: json['course_num']as int? ??0,
    question_name :json['question_name']as String? ??''
   , questions:json['questions']as List<dynamic>? ??[]
    )
    ;
  }
}