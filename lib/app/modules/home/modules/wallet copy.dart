import 'package:flutterwallet/app/modules/home/controllers/home_controller.dart';

class course_reservation {
  final int? id;
  // final String? name;
  // final String? description;
  final String?start_date;
  final String?place;
  final int ?price;
//   final String?updated_date;
// final String?type;
// final int?availableStudents;
// final String?placecountry;
// // final bool ?attendence;
// // final bool? sheets_paym;
// final String ?grade;
  final dynamic?students;
  final dynamic?course;
  
// final String  ?month_by_year;
  // final List<String>? courseIds;

  course_reservation({
    this.id,
    // this.name,
    // this.description,
    // this.created_date,
    // this.updated_date,
    // this.placecountry
    // this.attendence,
    // this.sheets_paym
    // ,
    // ,this.grade,
this.students,this.course,
this.price,
this.start_date,
this.place
// ,this.month_by_year
  });

  factory course_reservation.fromJson(Map<String, dynamic> json) {
    print('json1'+json['students'].toString());
    return course_reservation(
      id: json['id'] as int?,
      place:json['place'] ,
      price:json['price'] ,
      start_date:json['start_date'] ,
    //   name: json['name'] as String?,
    //   description: json['description'] as String?,
    //  created_date: json['created_date'] as String?,
    //  updated_date: json['updated_date'] as String?,
    // //  attendence:json['attendence']as bool?
    // //  ,sheets_paym:json['sheets_paym']as bool?
    // //  ,
    // availableStudents:json['availableStudents']as int?,
    //  grade:json['grade']as String?
    //  ,
    course: json['course']as dynamic?,
     students: json['students']as dynamic?
// ,     placecountry:json['placecountry']as String?,type: json['type']as String?
//     ,month_by_year: json['month_by_year']as String?
    );
  }
}
