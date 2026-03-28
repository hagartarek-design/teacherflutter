




class CourseInfo {
  final int? id;
final String? fromdate;
final String?todate;
final String?course_num;
final String?name; 
final String?course_center; 
final String?course_name;
final String?question_date;
final int?code;
final dynamic students;
final dynamic course;
//  final Map?course;
//  final String? gradeName;
  CourseInfo({
    this.id,
  this.fromdate,
  this.todate,
  this.course_num,
  this.name,
  this.course_center,
  this.course_name,
  this.question_date,
  this.code
  ,this.students
  ,this.course
  // this.examplace
  // ,this.totaldegree,
  // this.examprice,
  // this.course
    // this.gradeName
  });

  factory CourseInfo.fromJson(Map<String, dynamic> json) {
  print('json'+json['id'].toString());
    return CourseInfo(
      
      id: json['id'] as int?,
      fromdate:json['fromdate'] as String?,
      todate:json['todate'] as String?,
      course_num:json['course_num'] as String?,
      name:json['name'] as String?,
      course_center:json['course_center'] as String?,
      course_name:json['course_name'] as String?,
      question_date:json['question_date'] as String?,
      code:json['code'] as int?,
      students:json['students'] as dynamic??{},
      course:json['course'] as dynamic??{},
    //   examplace: json['examplace']as String?,
    //   examprice:json['examprice'] as int?
    //   ,totaldegree: json['totaldegree'] as String?
    // ,course: json['course']as Map?
    );

  }
}
