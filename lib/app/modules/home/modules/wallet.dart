
class Course {
  final int? id;
  final String? name;
  final String? description;
  final String?created_date;
  final String?updated_date;
final String ?grade;
final String?type;
final String  ?month_by_year;
final int?availableStudents;
final String?placecountry;
// final bool ?attendence;
// final bool? sheets_paym;
  final List<dynamic>?students;
  final List<dynamic>?student;
  final List<dynamic> ?course_attend;
  final List ?course_info;
final Map?student_id;
final List<dynamic> ? section;
// final Map? percentages;
final List<dynamic>? viewedPercentagesList;
final List<dynamic>? usedPercentagesList;
  Course({
    this.id,
    this.name,
    this.description,
    this.created_date,
    this.updated_date,
    this.grade,
    this.viewedPercentagesList,
    this.usedPercentagesList,
// this. attendence,
// this.sheets_paym,
this.type,
this.month_by_year
,this.availableStudents
,this.placecountry
,this.course_info
,this.students,this.student,
this.course_attend,this.student_id
,this.section,//this.percentages
  });

  factory Course.fromJson(Map<String, dynamic> json) { 
    return Course(

      id: json['id'] as int? ??0,
      name: json['name'] as String? ??'',
      description: json['description'] as String? ??'',
     created_date: json['created_date'] as String? ?? '',
     updated_date: json['Updated_date'] as String? ??'',
     grade:json['grade']as String? ??'',
    //  attendence:json['attendance']as bool?
    //  ,sheets_paym:json['sheets_paym']as bool?
    //  ,
     type:json['type']as String? ??''
    ,month_by_year: json['month_by_year']as String? ??''
    ,availableStudents:json['availableStudents']as int? ??0,
     placecountry:json['placecountry']as String? ??'',
     students: json['students']as List<dynamic>? ??[]
     ,student: json['student'] as List<dynamic>? ??[]
     ,course_attend: json['course_attend']as List<dynamic>? ??[],
    course_info: json['course_info'] as List<dynamic>? ??[]
    ,student_id:json['student_id'] as Map? ??{}
    ,section: json['section'] as List? ??[]

// ,percentages: json['percentages'] as Map? ??{},
   ,  viewedPercentagesList:json['viewedPercentagesList']as List<dynamic>? ??[],
     usedPercentagesList:json['usedPercentagesList']as List<dynamic>? ??[],
    );
  }
}
