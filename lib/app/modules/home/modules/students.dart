



class Student {
final int? id;
final String? name;
final int?number;
final bool?    attendance; 
final String ? grade;
//  final bool?   sheets_paym;
 final String?code;
 final String? Guardian;
 final int?percentage;
 final String?email;
final List? courses;
final String?branch;
final String?phoneNum;
final String?placecountry;
final Map?course;
final Map ?lessons;
final List<dynamic> ?exams;
final List<dynamic> ?lesson;
final String?img;
final String?coursetype;
//  final String? gradeName;
  Student({
    this.id,
    this.name,
    this.number,
    this.attendance,
    this.grade
    // ,this.sheets_paym
    ,this.code
    ,this. Guardian,
 this .percentage,
this.email,
this.courses
,this.branch
,this.phoneNum,this.placecountry,
    // this.gradeName
  this.course,
this.exams,this.lesson,
this.img,this.coursetype
,this.lessons  });

  factory Student.fromJson(Map<String, dynamic> json) {
print('json'+json['id'].toString());
    return Student(
      
      id: json['id'] as int? ??0,
      name: json['name'] as String? ??'',
    number :json ['number']as int? ??0, 
    attendance: json['attendance']as bool? ??false,
    grade:json['grade']as String?
    // ,sheets_paym:['sheets_paym']as bool ?  
    ,code:json['code']as String? ??''
    ,Guardian:json['Guardian_num']as String? ??''
     ,percentage:json['percentage'] as int? ??0
     ,email: json['email']as String? ??''
     ,courses: json['courses']as List? ??[]
    ,branch :json['branch'] as String? ??''
    ,phoneNum: json['phoneNum'] as String? ??''
    ,placecountry: json['placecountry']as String? ??''
    ,course: json['course'] as Map? ??{}
    ,exams:json['exam'] as List<dynamic>? ??[]
 ,img: json['img'] as String? ??'',
 coursetype: json['coursetype'] as String? ??'',lessons: json['lessons'] as Map? ??{},
    lesson: json['lesson'] as List<dynamic>? ?? [])
    ;
  }
  Map<String, double> calculateAttendancePercentages() {
    if (courses == null || courses!.isEmpty) {
      return {'present': 0, 'absent': 0, 'notAttended': 0};
    }

    int presentCount = 0;
    int absentCount = 0;
    int notAttendedCount = 0;

    // Iterate over the courses and count attendance
    for (var course in courses!) {
      if (course['attendance'] == 1) {
        presentCount++;
      } else if (course['attendance'] == 0) {
        absentCount++;
      } else if (course['attendance'] == 2) {
        notAttendedCount++;
      }
    }

    int totalCourses = courses!.length;
    double presentPercent = (totalCourses > 0) ? (presentCount / totalCourses) * 100 : 0;
    double absentPercent = (totalCourses > 0) ? (absentCount / totalCourses) * 100 : 0;
    double notAttendedPercent = (totalCourses > 0) ? (notAttendedCount / totalCourses) * 100 : 0;

    return {
      'present': presentPercent,
      'absent': absentPercent,
      'notAttended': notAttendedPercent,
    };
  }
}
